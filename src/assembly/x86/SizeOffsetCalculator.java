package assembly.x86;

import tac.tables.SubprogramsTable;
import tac.tables.VariablesTable;

public final class SizeOffsetCalculator {
    public void calculate(SubprogramsTable subprogramsTable, VariablesTable variablesTable) {
        for (VariablesTable.VariableInfo variableInfo : variablesTable.getVariablesList()) {
            SubprogramsTable.SubprogramInfo subprogramInfo = subprogramsTable.get(variableInfo.getTacSubprogram());
            int variableSize = variableInfo.getSize();
            int offset;
            if (subprogramInfo == null) { // global variable
                variablesTable.setGlobalVariablesSize(variablesTable.getGlobalVariablesSize() + variableSize);
                offset = -variablesTable.getGlobalVariablesSize();
            } else if (variableInfo.isSubprogramArgument()) {
                subprogramInfo.setLocalParametersSize(subprogramInfo.getLocalParametersSize() + variableSize);
                offset = subprogramInfo.getLocalParametersSize();
            } else {
                if (subprogramInfo.getLocalVariablesSize() == 0) {
                    subprogramInfo.setLocalVariablesSize(subprogramInfo.getLocalParametersSize());
                }
                subprogramInfo.setLocalVariablesSize(subprogramInfo.getLocalVariablesSize() + variableSize);
                offset = -subprogramInfo.getLocalVariablesSize();
            }
            variableInfo.setOffset(offset);
        }
    }
}
