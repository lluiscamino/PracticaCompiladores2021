package parser.symbols.expressions.literals;

import dot.DotNode;
import java_cup.runtime.ComplexSymbolFactory.Location;
import parser.symbols.types.Type;

public class BooleanLiteral extends Literal {
    
    public BooleanLiteral(boolean value, Location location) {
        super(value, Type.getBoolean(), location);
    }
    
    @Override
    public Boolean getValue() {
        return (boolean) literalValue;
    }
    
    @Override
    public void toDot() {
        DotNode dotNode = new DotNode("BOOL_LIT", "box", "filled", "#f2ad46");
        
        dotNode.addEdge(() -> {
            new DotNode(String.valueOf(getValue()), "plaintext", "", "");
        }, "value");
    }

    @Override
    public void toTac() {
        TACVariableGenerator tacVariableGenerator = main.Compiler.getCompiler().getSemanticAnalyzer().getTacVariableGenerator();

        TACVariable t = tacVariableGenerator.generate();  // t = novavar
        addTACInstruction(new CopyInstruction(t, new TACLiteral(value)));  //genera(t = lit)
        tacVariable = t;  //E0.r = t;
    }
}
