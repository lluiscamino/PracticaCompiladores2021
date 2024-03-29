package parser.symbols.expressions;

import dot.DotNode;
import main.Compiler;
import parser.symbols.ArrayIndexes;
import parser.symbols.types.PrimitiveType;
import parser.symbols.types.Type;
import tac.generators.TACTagGenerator;
import tac.generators.TACVariableGenerator;
import tac.instructions.arithmetic.AddInstruction;
import tac.instructions.arithmetic.CopyInstruction;
import tac.instructions.arithmetic.ProductInstruction;
import tac.instructions.array.NewDynamicArrayInstruction;
import tac.instructions.bifurcation.GotoInstruction;
import tac.instructions.bifurcation.SkipInstruction;
import tac.instructions.bifurcation.ifs.IfEqual;
import tac.instructions.indexation.indexassignment.IndexAssignmentInstruction;
import tac.instructions.indexation.indexassignment.IndexAssignmentToZeroInstruction;
import tac.references.TACLiteral;
import tac.references.TACTag;
import tac.references.TACVariable;

import java.util.List;

public final class ArrayInstance extends Expression {
    private final PrimitiveType primitiveType;
    private final ArrayIndexes indexes;

    public ArrayInstance(PrimitiveType primitiveType, ArrayIndexes indexes) {
        super(Type.getArray(primitiveType, indexes.numIndexes()), Mode.CONST, indexes.xleft);
        this.primitiveType = primitiveType;
        this.indexes = indexes;
    }

    @Override
    public void validate() {
        indexes.validate();
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("ARR_INSTANCE", "box", "filled", "#9077bf");

        dotNode.addEdge(getType(), "type");
        dotNode.addEdge(indexes, "indexes");
    }

    @Override
    public void toTac() {
        TACVariableGenerator variableGenerator = Compiler.getCompiler().getSemanticAnalyzer().getTacVariableGenerator();

        List<Expression> indexesArray = indexes.getIndexes().toArrayList();
        Expression firstIndex = indexesArray.get(0);
        firstIndex.toTac();
        tacVariable = variableGenerator.generate(getType());
        TACVariable arraySizeInBytes = variableGenerator.generate(Type.getInteger());
        int arrayDimensions = indexesArray.size();
        Type elementsType = Type.getArray(primitiveType, arrayDimensions - 1);

        addTACInstruction(new ProductInstruction(arraySizeInBytes, firstIndex.getTacVariable(), new TACLiteral(elementsType.sizeInBytes())));
        addTACInstruction(new AddInstruction(arraySizeInBytes, arraySizeInBytes, new TACLiteral(Type.getInteger().sizeInBytes())));
        addTACInstruction(new NewDynamicArrayInstruction(tacVariable, arraySizeInBytes));
        addTACInstruction(new IndexAssignmentToZeroInstruction(tacVariable, firstIndex.getTacVariable()));

        if (arrayDimensions > 1) {
            buildSubArraysTAC();
        }
    }

    private void buildSubArraysTAC() {
        TACVariableGenerator variableGenerator = Compiler.getCompiler().getSemanticAnalyzer().getTacVariableGenerator();
        TACTagGenerator tagGenerator = Compiler.getCompiler().getSemanticAnalyzer().getTacTagGenerator();

        List<Expression> indexesArray = indexes.getIndexes().toArrayList();
        Expression firstIndex = indexesArray.get(0);

        TACVariable index = variableGenerator.generate(Type.getInteger()),
                realIndex = variableGenerator.generate(Type.getInteger());
        TACTag startTag = tagGenerator.generate(), endTag = tagGenerator.generate();

        addTACInstruction(new CopyInstruction(index, new TACLiteral(0)));

        addTACInstruction(new SkipInstruction(startTag));
        addTACInstruction(new IfEqual(index, firstIndex.getTacVariable(), endTag));

        ArrayInstance subArray = generateSubArray();
        subArray.toTac();

        addTACInstruction(new ProductInstruction(realIndex, index, new TACLiteral(Type.getInteger().sizeInBytes())));
        addTACInstruction(new AddInstruction(realIndex, realIndex, new TACLiteral(Type.getInteger().sizeInBytes())));
        addTACInstruction(new IndexAssignmentInstruction(tacVariable, realIndex, subArray.getTacVariable()));
        addTACInstruction(new AddInstruction(index, index, new TACLiteral(1)));
        addTACInstruction(new GotoInstruction(startTag));
        addTACInstruction(new SkipInstruction(endTag));
    }

    private ArrayInstance generateSubArray() {
        return new ArrayInstance(primitiveType, new ArrayIndexes(indexes.getIndexes().next()));
    }
}
