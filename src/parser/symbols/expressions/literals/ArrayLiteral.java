package parser.symbols.expressions.literals;

import dot.DotNode;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import java_cup.runtime.ComplexSymbolFactory.Location;
import parser.symbols.SymbolList;
import parser.symbols.expressions.Expression;
import parser.symbols.types.PrimitiveType;
import parser.symbols.types.Type;
import tac.generators.TACVariableGenerator;
import tac.instructions.array.NewArrayInstruction;
import tac.instructions.indexation.IndexAssignmentInstruction;
import tac.references.TACLiteral;
import main.Compiler;

public final class ArrayLiteral extends Literal {
    
    public ArrayLiteral(SymbolList<Expression> exprList, Location location) {
        super(exprList, Type.getUnknown(), location);
    }
    
    @Override
    public Type getType() {
        SymbolList<Expression> exprList = getValue();
        if (exprList == null || exprList.getElement() == null) {
            return Type.getUnknown();
        }
       PrimitiveType primType = exprList.getElement().getType().getPrimitiveType();
       return Type.getArray(primType, getNumDimensions());
    }
    
    private int getNumDimensions() {
        SymbolList<Expression> exprList = getValue();
        Stack<Object> stack = new Stack<>();
        Stack<ArrayLiteral> dimensionsQueue = new Stack<>();
        stack.add(exprList);
        dimensionsQueue.add(this);
        int maxDimension = 1;
        while (!stack.empty()) {
            Object element = stack.pop();
            if (element == null) {
                dimensionsQueue.pop();
                continue;
            }
            if (element instanceof SymbolList) {
                SymbolList<Expression> symbolList = (SymbolList<Expression>) element;
                stack.add(symbolList.next());
                stack.add(symbolList.getElement());
            } else if (element instanceof ArrayLiteral) {
                ArrayLiteral arrayLit = (ArrayLiteral) element;
                dimensionsQueue.add(arrayLit);
                if (dimensionsQueue.size() > maxDimension) {
                    maxDimension = dimensionsQueue.size();
                }
                stack.add(arrayLit.getValue());
            }
        }
        return maxDimension;
    }
    
    @Override
    public SymbolList<Expression> getValue() {
        return (SymbolList<Expression>) literalValue;
    }
    
    @Override
    public void validate() {
        //pasar los elementos a una lista
        if (getValue() == null || getValue().size() <= 0) return;
        List<Expression> elements = getValue().toArrayList();
        //mirar si algun elemento es de otro tipo
        Type firstElType = elements.get(0).getType();
        for (Expression expr : elements) {
            Type exprType = expr.getType();
            if (!firstElType.isUnknown() && !exprType.isUnknown() && !exprType.equals(firstElType)) {
                addSemanticError("Los elementos de un array tienen que ser del mismo tipo. Se encontró un elemento de tipo " + exprType + " en un array de " + firstElType);
                return;
            }
            expr.validate();
        }
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("ARR_LIT", "box", "filled", "#f29202");
        
        dotNode.addEdgeIfNotNull(getValue(), "literals");
    }

    @Override
    public void toTac() {
        TACVariableGenerator variableGenerator = Compiler.getCompiler().getSemanticAnalyzer().getTacVariableGenerator();

        tacVariable = variableGenerator.generate(getType());
        List<Expression> items = getValue() != null ? getValue().toArrayList() : new ArrayList<>();
        int counter = 1;
        addTACInstruction(new NewArrayInstruction(tacVariable, new TACLiteral((items.size() + 1) * PrimitiveType.INT.sizeInBytes()))); // TODO: get real type
        addTACInstruction(new IndexAssignmentInstruction(tacVariable, new TACLiteral(0), new TACLiteral(items.size())));
        for (Expression item : items) {
            item.toTac();
            addTACInstruction(new IndexAssignmentInstruction(tacVariable, new TACLiteral(counter++ * PrimitiveType.INT.sizeInBytes()), item.getTacVariable()));
        }
    }
}
