package parser.symbols.expressions.arithmetic;

import dot.DotNode;
import parser.symbols.expressions.Expression;

public final class ArithmeticAdd extends ArithmeticOperation {

    public ArithmeticAdd(Expression leftExpression, Expression rightExpression) {
        super(leftExpression, rightExpression);
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("ADD", "box", "filled", "#9077bf");

        dotNode.addEdgeIfNotNull(leftExpression);
        dotNode.addEdgeIfNotNull(rightExpression);
    }

    @Override
    public void toTac() {
        TACVariableGenerator tacVariableGenerator = Compiler.getCompiler().getSemanticAnalyzer().getTacVariableGenerator();
        
        TACVariable t = tacVariableGenerator.generate();  // t = novavar
        addTACInstruction(new AddInstruction(t, leftExpression.getTacVariable(), rightExpression.getTacVariable()));  //genera(t = E1.r + E2.r)
        tacVariable = t;  //E0.r = t;
    }
}
