package parser.symbols.declarations.subprogram;

import dot.DotNode;
import java_cup.runtime.ComplexSymbolFactory.Location;
import main.Compiler;
import parser.symbols.Argument;
import parser.symbols.SymbolList;
import parser.symbols.statements.Return;
import parser.symbols.statements.Statement;
import parser.symbols.types.Type;
import symboltable.SymbolTable;
import tac.instructions.TACInstruction;
import tac.instructions.subprogram.returns.FunctionReturnInstruction;

public final class FunctionDeclaration extends SubprogramDeclaration {
    private final Type type;
    private final Return returnStatement;
    
    public FunctionDeclaration(String identifier, Type type, SymbolList<Argument> arguments, 
            SymbolList<Statement> statements, Return returnStatement, Location location) {
        super(identifier, arguments, statements, location);
        this.type = type;
        this.returnStatement = returnStatement;
    }
    
    public Type getReturnType() {
        return type;
    }

    @Override
    public void validate() {
        SymbolTable symbolTable = Compiler.getCompiler().getSemanticAnalyzer().getSymbolTable();
        symbolTable.enterBlock();
        validateArguments(symbolTable);
        validateStatements(symbolTable);
        returnStatement.validate();
        validateReturnType();
        symbolTable.exitBlock();
    }
    
    private void validateReturnType() {
        Type returnType = returnStatement.getExpressionType();
        if (!type.isUnknown() && !returnType.isUnknown() && !type.equals(returnType)) {
            addSemanticError("La función " + identifier + " debería devolver un tipo " + type + " pero devuelve un valor de tipo " + returnType);
        }
    }

    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("FUNCTION", "", "filled", "#005cc5");
        
        dotNode.addEdge(() -> new DotNode(identifier, "plaintext", "filled", ""), "ident");
        dotNode.addEdge(type, "type");
        dotNode.addEdgeIfNotNull(arguments, "args");
        dotNode.addEdgeIfNotNull(statements, "stmts");
        dotNode.addEdge(returnStatement, "return");
    }
    
    @Override
    public String toString() {
        int lineNum = xleft != null ? xleft.getLine() : -1;
        return lineNum + ": function " + identifier + " " + type + " (" + numArguments() + " args)";
    }

    @Override
    protected TACInstruction returnInstruction() {
        returnStatement.toTac();
        return new FunctionReturnInstruction(tacSubprogram, returnStatement.getExpression().getTacVariable());
    }
}
