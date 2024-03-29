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
import tac.instructions.TACInstruction;
import tac.instructions.bifurcation.SkipInstruction;
import tac.instructions.subprogram.PreambleInstruction;
import tac.references.TACSubprogram;
import tac.references.TACTag;
import tac.tables.SubprogramsTable;

import java.util.ArrayList;
import java.util.List;

public abstract class SubprogramDeclaration extends Declaration {
    protected final SymbolList<Argument> arguments;
    protected final SymbolList<Statement> statements;

    protected TACSubprogram tacSubprogram;
    private TACTag tacStartTag;

    public SubprogramDeclaration(String identifier, SymbolList<Argument> arguments, 
            SymbolList<Statement> statements, Location location) {
        super(identifier, location);
        this.arguments = arguments;
        this.statements = statements;
    }

    public void addToSubprogramsTable() {
        SemanticAnalyzer semanticAnalyzer = Compiler.getCompiler().getSemanticAnalyzer();
        TACSubprogramGenerator subprogramGenerator = semanticAnalyzer.getTacSubprogramGenerator();
        TACTagGenerator tagGenerator = semanticAnalyzer.getTacTagGenerator();
        SubprogramsTable subprogramsTable = semanticAnalyzer.getSubprogramsTable();

        tacSubprogram = subprogramGenerator.generate();
        tacStartTag = tagGenerator.generate("t_" + identifier);
        subprogramsTable.add(identifier, tacSubprogram, tacStartTag, numArguments());
    }

    public final List<Argument> toArrayListArguments() {
        if (arguments == null) return new ArrayList<>();
        return arguments.toArrayList();
    }

    @Override
    public void toTac() {
        SymbolTable symbolTable = Compiler.getCompiler().getSemanticAnalyzer().getSymbolTable();

        addTACInstruction(new SkipInstruction(tacStartTag));
        addTACInstruction(new PreambleInstruction(tacSubprogram));
        symbolTable.enterBlock(tacSubprogram);
        if (arguments != null) {
            arguments.toTac();
        }
        if (statements != null) {
            statements.toTac();
        }
        addTACInstruction(returnInstruction());
        symbolTable.exitBlock();
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

    protected abstract TACInstruction returnInstruction();
}
