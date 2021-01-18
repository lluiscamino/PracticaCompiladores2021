package parser.symbols;

import dot.DotNode;
import parser.symbols.declarations.Declaration;
import parser.symbols.declarations.DeclarationMode;
import parser.symbols.declarations.cva.ArrayDeclaration;
import parser.symbols.declarations.cva.PrimitiveDeclaration;
import parser.symbols.types.Type;
import symboltable.SymbolTable;

public final class Argument extends ParserSymbol {
    private static final String STRING_IDENTIFIER = "ARGUMENT";
    private final Type type;
    private final String identifier;

    public Argument(Type type, String identifier) {
        super(STRING_IDENTIFIER);
        this.type = type;
        this.identifier = identifier;
    }
    
    public Type getType() {
        return this.type;
    }
    
    @Override
    public void validate(SymbolTable symbolTable) {
        Declaration declaration = type.isArray() ?
                new ArrayDeclaration(DeclarationMode.getVariable(), type.getPrimitiveType(), type.getDimensions(), identifier) :
                new PrimitiveDeclaration(DeclarationMode.getVariable(), type.getPrimitiveType(), identifier);
        if (!symbolTable.put(declaration)) {
            addSemanticError("Variable " + identifier + " ya definida");
        }
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode(STRING_IDENTIFIER, "box", "filled", "");
        dotNode.addEdge(type, "type");
        dotNode.addEdge(() -> {
            new DotNode(identifier, "plaintext", "", "");
        }, "ident");
    }
    
}
