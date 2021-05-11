package parser.symbols.declarations.subprogram;

import analyzers.SemanticAnalyzer;
import java_cup.runtime.ComplexSymbolFactory.Location;
import main.Compiler;
import parser.symbols.Argument;
import parser.symbols.SymbolList;
import parser.symbols.declarations.Declaration;
import parser.symbols.statements.Statement;
import symboltable.SymbolTable;
import tac.generators.TACSubprogramGenerator;
import tac.generators.TACTagGenerator;
import tac.instructions.bifurcation.SkipInstruction;
import tac.instructions.subprogram.PreambleInstruction;
import tac.instructions.subprogram.ReturnInstruction;
import tac.references.TACSubprogram;
import tac.references.TACTag;
import tac.tables.SubprogramsTable;

import java.util.ArrayList;
import java.util.List;

public abstract class SubprogramDeclaration extends Declaration {
    protected final SymbolList<Argument> arguments;
    protected final SymbolList<Statement> statements;

    public SubprogramDeclaration(String identifier, SymbolList<Argument> arguments, 
            SymbolList<Statement> statements, Location location) {
        super(identifier, location);
        this.arguments = arguments;
        this.statements = statements;
    }

    @Override
    public void toTac() {
        SemanticAnalyzer semanticAnalyzer = Compiler.getCompiler().getSemanticAnalyzer();
        SymbolTable symbolTable = semanticAnalyzer.getSymbolTable();
        TACSubprogramGenerator subprogramGenerator = semanticAnalyzer.getTacSubprogramGenerator();
        TACTagGenerator tagGenerator = semanticAnalyzer.getTacTagGenerator();
        SubprogramsTable subprogramsTable = semanticAnalyzer.getSubprogramsTable();

        TACSubprogram subprogram = subprogramGenerator.generate();
        TACTag startTag = tagGenerator.generate();
        subprogramsTable.add(identifier, subprogram, startTag, numArguments());
        addTACInstruction(new SkipInstruction(startTag));
        addTACInstruction(new PreambleInstruction(subprogram));
        symbolTable.enterBlock(subprogram);
        if (arguments != null) {
            arguments.toTac();
        }
        if (statements != null) {
            statements.toTac();
        }
        symbolTable.exitBlock();
        addTACInstruction(new ReturnInstruction(subprogram));
    }
    
    protected final void validateArguments(SymbolTable symbolTable) {
        if (arguments != null) {
            arguments.validate();
        }
    }
    
    protected final void validateStatements(SymbolTable symbolTable) {
        if (statements != null) {
            statements.validate();
        }
    }

    protected final int numArguments() {
        return arguments != null ? arguments.size() : 0;
    }
    
    public final List<Argument> toArrayListArguments() {
        if (arguments == null) return new ArrayList<>();
        return arguments.toArrayList();
    }
}
