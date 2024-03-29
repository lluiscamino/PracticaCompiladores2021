package parser.symbols.expressions;

import dot.DotNode;

public final class Priority extends Expression {
    private final Expression expression;
    
    public Priority(Expression expression) {
        super(expression.getType(), expression.getMode(), expression.xleft);
        this.expression = expression;
    }

    @Override
    public void validate() {
        expression.validate();
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("EXPR_PRIO", "box", "filled", "#9077bf");
        
        dotNode.addEdgeIfNotNull(expression, "expr");
    }

    @Override
    public void toTac() {
        expression.toTac();
        tacVariable = expression.getTacVariable();
    }
}
