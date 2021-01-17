package parser.symbols;

import dot.DotNode;
import parser.symbols.expressions.*;
import parser.symbols.types.Type;
import symboltable.SymbolTable;

public final class Call extends ParserSymbol {
    private static final String STRING_IDENTIFIER = "CALL";
    
    private final String subProgramIdentifier;
    private final SymbolList<Expression> arguments;
    
    public Call(String subProgramIdentifier, SymbolList<Expression> arguments) {
        super(STRING_IDENTIFIER);
        this.subProgramIdentifier = subProgramIdentifier;
        this.arguments = arguments;
    }
    
    public Type getReturnType() {
        // TODO: Consultar tabla de símbolos
        return null;
    }

    @Override
    public void validate(SymbolTable symbolTable) {
        //buscar el identificador en la tabla de simbolos
        Declaration decl = symbolTable.get(subProgramIdentifier);
        if (decl == null) {
            this.addSemanticError("No existe un subprograma llamado " + this.subProgramIdentifier);
            return;
        }
        if (!(decl instanceof SubprogramDeclaration)) {
            this.addSemanticError("El identificar " + this.subProgramIdentifier + " no pertenece a un subprograma.");
            return;
        }
        //mirar si los tipos de argumentos coinciden
        SubprogramDeclaration subpDecl = (SubprogramDeclaration) decl;
        
        List<Expression> actualArgs  = arguments.toArrayList();
        List<Argument> args = subpDecl.toArrayListArguments();
        
        //comparar la cantidad de argumentos
        if (arguments.size() != args.size()) {
            this.addSemanticError("Cantidad de argumentos incorrecta.");
            return;
        }
        
        //comparar los tipos de argumentos
        for (int i = 0; i < actualArgs.size(); i++) {
            if (actualArgs.get(i).getType() != args.get(i).getType()) {
                this.addSemanticError("El tipo de argumento " + i + " tiene que ser de tipo " + args.get(i).getType().getName());
            }
        }
        
        
        arguments.validate(symbolTable);
    }

    @Override
    public void toDot(StringBuilder buffer) {
        DotNode dotNode = new DotNode(buffer, "CALL", "", "filled", "#00a2ff");
        
        dotNode.addEdge((StringBuilder buffer1) -> {
            DotNode dotNode1 = new DotNode(buffer1, subProgramIdentifier, "plaintext", "", "");
        }, "ident");
        dotNode.addEdgeIfNotNull(arguments, "args");
    }
    
}
