package parser.symbols;

import dot.DOTizable;
import errors.SemanticError;
import java_cup.runtime.ComplexSymbolFactory.ComplexSymbol;
import java_cup.runtime.ComplexSymbolFactory.Location;
import main.Compiler;
import tac.TACizable;
import tac.instructions.TACInstruction;

import java.util.List;

public abstract class ParserSymbol extends ComplexSymbol implements DOTizable, TACizable {
    
    public ParserSymbol(String name) {
        super(name, 0);
    }
    
    public ParserSymbol(String name, Location location) {
        super(name, 0);
        this.xleft = location;
    }
    
    public abstract void validate();
    
    @Override
    public abstract void toDot();

    @Override
    public abstract void toTac();

    protected void addTACInstruction(TACInstruction instruction) {
        List<TACInstruction> instructionList = Compiler.getCompiler().getSemanticAnalyzer().getTacInstructionList();
        instructionList.add(instruction);
    }
    
    protected void addSemanticError(String message) {
        Compiler.getCompiler().getErrorsList().add(new SemanticError(message, xleft));
    }
}
