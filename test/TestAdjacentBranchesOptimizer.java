import optimizers.AdjacentBranchesOptimizer;
import optimizers.TACOptimizer;
import org.junit.Test;
import tac.instructions.TACInstruction;
import tac.instructions.arithmetic.CopyInstruction;
import tac.instructions.bifurcation.GotoInstruction;
import tac.instructions.bifurcation.SkipInstruction;
import tac.instructions.bifurcation.ifs.IfDiff;
import tac.instructions.bifurcation.ifs.IfEqual;
import tac.references.TACLiteral;
import tac.references.TACTag;
import tac.references.TACVariable;

import java.util.Arrays;
import java.util.List;

public final class TestAdjacentBranchesOptimizer {

    @Test
    public void testNotAdjacentBranchesIgnored() {
        TACVariable variable = new TACVariable(0);
        TACLiteral zero = new TACLiteral(0);
        TACTag e1 = new TACTag(0), e2 = new TACTag(1);
        List<TACInstruction> unoptimizedInstructions = Arrays.asList(
                new IfEqual(variable, zero, e1),
                new CopyInstruction(variable, zero),
                new GotoInstruction(e2),
                new SkipInstruction(e1),
                new SkipInstruction(e2)
        );
        TACOptimizer optimizer = new AdjacentBranchesOptimizer(unoptimizedInstructions);
        List<TACInstruction> optimizedInstructions = optimizer.optimize();
        assertEqualTACInstructionLists(optimizedInstructions, unoptimizedInstructions);
    }

    @Test
    public void testDifferentTagsIgnored() {
        TACVariable variable = new TACVariable(0);
        TACLiteral zero = new TACLiteral(0);
        TACTag e1 = new TACTag(0), e2 = new TACTag(1), e3 = new TACTag(2);
        List<TACInstruction> unoptimizedInstructions = Arrays.asList(
                new IfEqual(variable, zero, e3),
                new GotoInstruction(e2),
                new SkipInstruction(e1),
                new SkipInstruction(e2)
        );
        TACOptimizer optimizer = new AdjacentBranchesOptimizer(unoptimizedInstructions);
        List<TACInstruction> optimizedInstructions = optimizer.optimize();
        assertEqualTACInstructionLists(optimizedInstructions, unoptimizedInstructions);
    }

    @Test
    public void testAdjacentBranchesOptimized() {
        TACVariable variable = new TACVariable(0);
        TACLiteral zero = new TACLiteral(0);
        TACTag e1 = new TACTag(0), e2 = new TACTag(1);
        List<TACInstruction> unoptimizedInstructions = Arrays.asList(
                new IfEqual(variable, zero, e1),
                new GotoInstruction(e2),
                new SkipInstruction(e1),
                new CopyInstruction(variable, zero),
                new SkipInstruction(e2)
        );
        List<TACInstruction> expectedOptimizedInstructions = Arrays.asList(
                new IfDiff(variable, zero, e2),
                new SkipInstruction(e1),
                new CopyInstruction(variable, zero),
                new SkipInstruction(e2)
        );
        TACOptimizer optimizer = new AdjacentBranchesOptimizer(unoptimizedInstructions);
        List<TACInstruction> optimizedInstructions = optimizer.optimize();
        assertEqualTACInstructionLists(optimizedInstructions, expectedOptimizedInstructions);
    }

    private void assertEqualTACInstructionLists(List<TACInstruction> list1, List<TACInstruction> list2) {
        assert list1.size() == list2.size();
        for (int i = 0; i < list1.size(); i++) {
            assert list1.get(i).toString().equals(list2.get(i).toString());
        }
    }
}
