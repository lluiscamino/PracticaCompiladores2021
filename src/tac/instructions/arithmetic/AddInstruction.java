package tac.instructions.arithmetic;

import assembly.AssemblyCodeGenerator;
import tac.references.TACReference;
import tac.references.TACVariable;

public final class AddInstruction extends ArithmeticInstruction {
    public AddInstruction(TACVariable firstVariable, TACVariable secondVariable, TACReference thirdReference) {
        super(firstVariable, secondVariable, thirdReference);
    }

    public String toAssemblyCode(AssemblyCodeGenerator codeGenerator) {
        return codeGenerator.generate(this);
    }

    @Override
    public String toString() {
        return firstReference + " = " + secondReference + " + " + thirdReference;
    }
}
