package parser.symbols.expressions.binary;

import dot.DotNode;
import parser.symbols.RelationalOperatorType;
import parser.symbols.expressions.Expression;
import parser.symbols.types.Type;

public final class Relational extends Expression {
    private final Expression leftExpression, rightExpression;
    private final RelationalOperatorType operator;

    public Relational(Expression leftExpression, RelationalOperatorType operator, Expression rightExpression) {
        super(Type.getBoolean(), Mode.RESULT, leftExpression.xleft);
        this.leftExpression = leftExpression;
        this.operator = operator;
        this.rightExpression = rightExpression;
    }

    @Override
    public void validate() {
        Type leftExprType = leftExpression.getType();
        Type rightExprType = rightExpression.getType();
        boolean unknownType = leftExprType.isUnknown() || rightExprType.isUnknown();
        if (!unknownType && !(leftExprType.equals(rightExprType))) {
            addSemanticError("No se pueden comparar tipos diferentes (" + leftExprType + " y " + rightExprType + ")");
        }
        if (!unknownType && !validType(leftExprType)) {
            addSemanticError("No se pueden comparar expresiones de tipo " + leftExprType);
        }
        leftExpression.validate();
        rightExpression.validate();
    }
    
    private boolean validType(Type type) {
        if (type.isInteger()) return true;
        if (type.isBoolean() || type.isString() || type.isArray()) {
            return operator == RelationalOperatorType.EQUAL ||
                    operator == RelationalOperatorType.DIFF;
        }
        return false;
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("RELATIONAL", "box", "filled", "#9077bf");
        
        dotNode.addEdgeIfNotNull(leftExpression);
        dotNode.addEdgeIfNotNull(operator, "operator");
        dotNode.addEdgeIfNotNull(rightExpression);
    }

    @Override
    public void toTac() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
