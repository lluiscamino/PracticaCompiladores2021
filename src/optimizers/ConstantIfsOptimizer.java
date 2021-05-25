package optimizers;

import tac.instructions.TACInstruction;
import tac.instructions.bifurcation.GotoInstruction;
import tac.instructions.bifurcation.ifs.IfInstruction;
import tac.references.TACLiteral;
import tac.references.TACTag;

import java.util.ArrayList;
import java.util.List;

/**
 * Searches and optimizes constant ifs. Turns a sequence like the following:
 * <pre>
 *     if 0 = 0 goto e3
 * </pre>
 * Into this:
 * <pre>
 *     goto e3
 * </pre>
 * And a sequence like this:
 * <pre>
 *     if 0 = -1 goto e3
 *     ...
 * </pre>
 * Into this:
 * <pre>
 *     ...
 * </pre>
 */
public class ConstantIfsOptimizer implements TACOptimizer {
    private final List<TACInstruction> unoptimizedInstructions;

    public ConstantIfsOptimizer(List<TACInstruction> unoptimizedInstructions) {
        this.unoptimizedInstructions = unoptimizedInstructions;
    }

    @Override
    public List<TACInstruction> optimize() {
        List<TACInstruction> optimizedInstructions = new ArrayList<>();
        for (TACInstruction instruction : unoptimizedInstructions) {
            if (canBeOptimized(instruction)) {
                if (conditionIsTrue((IfInstruction) instruction)) {
                    optimizedInstructions.add(new GotoInstruction((TACTag) instruction.getThirdReference()));
                }
            } else {
                optimizedInstructions.add(instruction);
            }
        }
        return optimizedInstructions;
    }

    private boolean canBeOptimized(TACInstruction instruction) {
        return instruction instanceof IfInstruction &&
                instruction.getFirstReference() instanceof TACLiteral &&
                instruction.getSecondReference() instanceof TACLiteral;
    }

    private boolean conditionIsTrue(IfInstruction ifInstruction) {
        return ifInstruction.getFirstReference().equals(ifInstruction.getSecondReference());
    }
}
