package parser.symbols.expressions.reference;

import dot.DotNode;
import parser.symbols.ArrayIndexes;
import symboltable.SymbolTable;


public final class ArrayIdentifierReference extends IdentifierReference {
    private final ArrayIndexes indexes;
    
    public ArrayIdentifierReference(String identifierName, ArrayIndexes indexes) {
        super(identifierName);
        this.indexes = indexes;
    }
    
    @Override
    public void validate(SymbolTable symbolTable) {
        //mirar la tabla de simbolos
        indexes.validate(symbolTable);
    }

    @Override
    public void toDot(StringBuilder buffer) {
        DotNode dotNode = new DotNode(buffer, "IDENT_ARR", "", "filled", "#00a2ff");
        
        dotNode.addEdge((StringBuilder buffer1) -> {
            DotNode dotNode1 = new DotNode(buffer1, identifierName, "plaintext", "", "");
        }, "ident");
        dotNode.addEdgeIfNotNull(indexes, "indexes");
    }
    
}
