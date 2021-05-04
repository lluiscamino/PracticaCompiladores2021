package tac.instructions.arithmetic;

import assembly.AssemblyCodeGenerator;
import tac.references.TACVariable;

public final class SubtractInstruction extends ArithmeticInstruction {
    public SubtractInstruction(TACVariable firstVariable, TACVariable secondVariable, TACVariable thirdVariable) {
        super(firstVariable, secondVariable, thirdVariable);
    }

    public String toAssemblyCode(AssemblyCodeGenerator codeGenerator) {
        return codeGenerator.generate(this);
    }

    @Override
    public String toString() {
        return firstReference + " = " + secondReference + " - " + thirdReference;
    }
}
