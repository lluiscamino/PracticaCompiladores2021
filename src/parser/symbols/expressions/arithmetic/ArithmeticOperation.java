package parser.symbols.expressions.arithmetic;

import java.io.PrintWriter;
import parser.symbols.expressions.Expression;
import parser.symbols.operators.ArithmeticOperator;

public final class ArithmeticOperation extends Expression {
    private final Expression leftExpression, rightExpression;
    private final ArithmeticOperator operator;
    
    public ArithmeticOperation(Expression leftExpression, ArithmeticOperator operator, Expression rightExpression) {
        this.leftExpression = leftExpression;
        this.operator = operator;
        this.rightExpression = rightExpression;
    }

    @Override
    public void validate() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void toDot(PrintWriter out) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
