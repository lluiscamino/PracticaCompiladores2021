package parser.symbols.declarations;

import dot.DotNode;
import java_cup.runtime.ComplexSymbolFactory.Location;
import parser.symbols.ParserSymbol;

public final class DeclarationMode extends ParserSymbol {
    private static final String STRING_IDENTIFIER = "DECL_MODE";
    
    private enum Mode {
        CONST, VAR
    }
    
    private final Mode mode;
    
    private DeclarationMode(Mode mode) {
        super(STRING_IDENTIFIER);
        this.mode = mode;
    }
    
    private DeclarationMode(Mode mode, Location location) {
        super(STRING_IDENTIFIER, location);
        this.mode = mode;
    }
    
    public boolean isConstant() {
        return mode == Mode.CONST;
    }
    
    public boolean isVariable() {
        return mode == Mode.VAR;
    }

    @Override
    public void validate() {
    }

    @Override
    public void toDot() {
        new DotNode(mode.toString(), "", "filled", "");
    }

    @Override
    public void toTac() {}
    
    @Override
    public String toString() {
        return isConstant() ? "const" : "var";
    }
    
    public static DeclarationMode getConstant() {
        return new DeclarationMode(Mode.CONST);
    }
    
    public static DeclarationMode getVariable() {
        return new DeclarationMode(Mode.VAR);
    }
    
    public static DeclarationMode getConstant(Location location) {
        return new DeclarationMode(Mode.CONST, location);
    }
    
    public static DeclarationMode getVariable(Location location) {
        return new DeclarationMode(Mode.VAR, location);
    }
    
}
