package parser.symbols.expressions.arithmetic;

import dot.DotNode;
import main.Compiler;
import parser.symbols.expressions.Expression;
import parser.symbols.types.Type;
import tac.generators.TACVariableGenerator;
import tac.instructions.arithmetic.DivideInstruction;

public final class ArithmeticDivide extends ArithmeticOperation {

    public ArithmeticDivide(Expression leftExpression, Expression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("DIV", "box", "filled", "#9077bf");

        dotNode.addEdgeIfNotNull(leftExpression);
        dotNode.addEdgeIfNotNull(rightExpression);
    }

    @Override
    public void toTac() {
        TACVariableGenerator tacVariableGenerator = Compiler.getCompiler().getSemanticAnalyzer().getTacVariableGenerator();

        leftExpression.toTac();
        rightExpression.toTac();
        
        tacVariable = tacVariableGenerator.generate(Type.getInteger());  // t = novavar
        addTACInstruction(new DivideInstruction(tacVariable, leftExpression.getTacVariable(), rightExpression.getTacVariable()));  //genera(t = E1.r / E2.r)
    }
}
