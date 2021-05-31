package optimizers;

import tac.instructions.TACInstruction;
import tac.instructions.arithmetic.*;
import tac.instructions.binary.AndInstruction;
import tac.instructions.binary.BinaryInstruction;
import tac.instructions.binary.NotInstruction;
import tac.instructions.binary.OrInstruction;
import tac.references.TACLiteral;
import tac.references.TACVariable;

import java.util.ArrayList;
import java.util.List;

import static assembly.x86.AssemblyCodeGenerationConstants.FALSE;
import static assembly.x86.AssemblyCodeGenerationConstants.TRUE;

public final class ConstantOperationsOptimizer extends TACOptimizer {
    public ConstantOperationsOptimizer(List<TACInstruction> unoptimizedInstructions) {
        super(unoptimizedInstructions);
    }

    @Override
    public List<TACInstruction> optimize() {
        List<TACInstruction> optimizedInstructions = new ArrayList<>();
        for (TACInstruction instruction : unoptimizedInstructions) {
            optimizedInstructions.add(canBeOptimized(instruction) ? optimize(instruction) : instruction);
        }
        return optimizedInstructions;
    }

    private boolean canBeOptimized(TACInstruction instruction) {
        return twoArgumentsInstructionCanBeOptimized(instruction) || threeArgumentsInstructionCanBeOptimized(instruction);
    }

    private boolean twoArgumentsInstructionCanBeOptimized(TACInstruction instruction) {
        return (instruction instanceof NegativeInstruction || instruction instanceof NotInstruction) &&
                instruction.getSecondReference() instanceof TACLiteral;
    }

    private boolean threeArgumentsInstructionCanBeOptimized(TACInstruction instruction) {
        return (instruction instanceof ArithmeticInstruction || instruction instanceof BinaryInstruction) &&
                instruction.getSecondReference() instanceof TACLiteral &&
                instruction.getThirdReference() instanceof TACLiteral;
    }

    private TACInstruction optimize(TACInstruction instruction) {
        return isTwoArgumentsInstruction(instruction) ?
                optimizeTwoArgumentsInstruction(instruction) :
                optimizeThreeArgumentsInstruction(instruction);
    }

    private boolean isTwoArgumentsInstruction(TACInstruction instruction) {
        return instruction.getThirdReference() == null;
    }

    private TACInstruction optimizeTwoArgumentsInstruction(TACInstruction instruction) {
        TACVariable firstVariable = (TACVariable) instruction.getFirstReference();
        Integer value = (Integer) ((TACLiteral) instruction.getSecondReference()).getValue(),
                newValue = instruction instanceof NegativeInstruction ? -value : booleanToInteger(!integerToBoolean(value));
        return new CopyInstruction(firstVariable, new TACLiteral(newValue));
    }

    private TACInstruction optimizeThreeArgumentsInstruction(TACInstruction instruction) {
        TACVariable firstVariable = (TACVariable) instruction.getFirstReference();
        return new CopyInstruction(firstVariable, getNewValue(instruction));
    }

    private TACLiteral getNewValue(TACInstruction instruction) {
        Integer secondLiteral = ((Integer) ((TACLiteral) instruction.getSecondReference()).getValue()),
                thirdLiteral = ((Integer) ((TACLiteral) instruction.getThirdReference()).getValue());
        int newValue;
        if (instruction instanceof AddInstruction) {
            newValue = secondLiteral + thirdLiteral;
        } else if (instruction instanceof DivideInstruction) {
            newValue = secondLiteral / thirdLiteral;
        } else if (instruction instanceof ModuloInstruction) {
            newValue = secondLiteral % thirdLiteral;
        } else if (instruction instanceof ProductInstruction) {
            newValue = secondLiteral * thirdLiteral;
        } else if (instruction instanceof SubtractInstruction) {
            newValue = secondLiteral - thirdLiteral;
        } else if (instruction instanceof AndInstruction) {
            newValue = booleanToInteger(integerToBoolean(secondLiteral) && integerToBoolean(thirdLiteral));
        } else if (instruction instanceof OrInstruction) {
            newValue = booleanToInteger(integerToBoolean(secondLiteral) || integerToBoolean(thirdLiteral));
        } else {
            throw new RuntimeException(instruction + " not recognized by ConstantOperationsOptimizer");
        }
        return new TACLiteral(newValue);
    }

    private boolean integerToBoolean(Integer integer) {
        return integer == TRUE;
    }

    private int booleanToInteger(boolean bool) {
        return bool ? TRUE : FALSE;
    }
}