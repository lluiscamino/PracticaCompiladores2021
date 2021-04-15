package parser.symbols.statements.io;

import dot.DotNode;
import parser.symbols.expressions.Expression;
import parser.symbols.statements.Statement;

public final class Print extends Statement {
    
    private final Expression expression;
    
    public Print(Expression expression) {
        super(expression.xleft);
        this.expression = expression;
    }

    @Override
    public void validate() {
        expression.validate();
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("PRINT", "", "filled", "#5280d6");
        dotNode.addEdge(expression, "expr");
    }

    @Override
    public void toTac() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
