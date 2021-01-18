package parser.symbols;

import parser.symbols.expressions.Expression;
import parser.symbols.types.Type;
import symboltable.SymbolTable;

public final class ArrayIndexes extends ParserSymbol {
    private static final String STRING_IDENTIFIER = "ARR_INDEX";
    
    private SymbolList<Expression> indexes;

    public ArrayIndexes(Expression lastIndex) {
        super(STRING_IDENTIFIER);
        this.indexes = new SymbolList<>();
        this.indexes = new SymbolList<>(indexes, lastIndex);
    }
    
    public void addIndex(Expression index) {
        indexes = new SymbolList<>(indexes, index);
    }
    
    public int numIndexes() {
        return indexes.size();
    }

    @Override
    public void validate(SymbolTable symbolTable) {
        indexes.validate(symbolTable);
        for (Expression index : indexes.toArrayList()) {
            if (!index.getType().isInteger()) {
                addSemanticError("Los índices de un array deben ser de tipo " + Type.getInteger() + ", no de tipo " + index.getType());
            }
        }
    }

    @Override
    public void toDot() {
        indexes.toDot();
    }
    
}
