package parser.symbols.expressions.binary;

import dot.DotNode;
import parser.symbols.expressions.Expression;
import parser.symbols.types.Type;
import tac.generators.TACVariableGenerator;
import tac.instructions.binary.AndInstruction;

public final class BinaryAnd extends BinaryOperation {
    
    public BinaryAnd(Expression leftExpression, Expression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("AND", "box", "filled", "#9077bf");
        
        dotNode.addEdgeIfNotNull(leftExpression);
        dotNode.addEdgeIfNotNull(rightExpression);
    }

    @Override
    public void toTac() {
        TACVariableGenerator tacVariableGenerator = main.Compiler.getCompiler().getSemanticAnalyzer().getTacVariableGenerator();

        leftExpression.toTac();
        rightExpression.toTac();

        tacVariable = tacVariableGenerator.generate(Type.getBoolean());  // t = novavar
        addTACInstruction(new AndInstruction(tacVariable, leftExpression.getTacVariable(), rightExpression.getTacVariable()));  //genera(t = E1.r && E2.r)
    }
}
