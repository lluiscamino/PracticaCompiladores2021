package assembly;

import main.Compiler;
import tac.instructions.arithmetic.*;
import tac.instructions.bifurcation.GotoInstruction;
import tac.instructions.bifurcation.SkipInstruction;
import tac.instructions.bifurcation.ifs.*;
import tac.instructions.binary.AndInstruction;
import tac.instructions.binary.NotInstruction;
import tac.instructions.binary.OrInstruction;
import tac.instructions.indexation.IndexAssignmentInstruction;
import tac.instructions.indexation.IndexedValueInstruction;
import tac.instructions.io.ReadInstruction;
import tac.instructions.io.print.PrintArrayInstruction;
import tac.instructions.io.print.PrintBooleanInstruction;
import tac.instructions.io.print.PrintIntInstruction;
import tac.instructions.io.print.PrintStringInstruction;
import tac.instructions.length.StringLengthInstruction;
import tac.instructions.subprogram.ComplexParameterInstruction;
import tac.instructions.subprogram.PreambleInstruction;
import tac.instructions.subprogram.ReturnInstruction;
import tac.instructions.subprogram.SimpleParameterInstruction;
import tac.instructions.subprogram.calls.FunctionCallInstruction;
import tac.instructions.subprogram.calls.ProcedureCallInstruction;
import tac.references.*;
import tac.tables.SubprogramsTable;
import tac.tables.VariablesTable;

import java.util.ArrayList;
import java.util.List;

public class x86CodeGenerator implements AssemblyCodeGenerator {
    private final List<String> constantDeclarations;

    public x86CodeGenerator() {
        constantDeclarations = new ArrayList<>();
        constantDeclarations.add("decl_0: .asciz \"true\\n\"\n");
        constantDeclarations.add("decl_1: .asciz \"false\\n\"\n");
    }

    @Override
    public String preamble() {
        SubprogramsTable subprogramsTable = Compiler.getCompiler().getSemanticAnalyzer().getSubprogramsTable();
        return String.format("""
                        .section\t__TEXT, __text
                        \t.globl\t_main
                        \t.globl\tprint_uint64
                        \t.globl\tprint_boolean
                        \t.globl\tprint_string
                        \t.globl\tstring_length
                        %s
                        %s
                        %s
                        %s
                        _main:
                        \tcall\t%s
                        \tmov \t$0x02000001, %%rax
                        \txor \t$0, %%rdi
                        \tsyscall
                        """,
                printIntegerFunction(),
                printBooleanFunction(),
                printStringFunction(),
                stringLengthFunction(),
                subprogramsTable.get("main").getTag()
        );
    }

    private String printIntegerFunction() {
        return """
                print_uint64:
                \tlea \t-1(%rsp), %rsi
                \tmovb\t$'\\n', (%rsi)
                \tmov \t$10, %ecx
                \tmovl\t%edi, %ebx
                \ttestl\t%edi, %edi
                \tjns \t.print_uint64_positive
                \tneg \t%edi
                    
                .print_uint64_positive:
                \tmov \t%rdi, %rax
                    
                .Ltoascii_digit:
                \txor \t%edx, %edx
                \tdiv \t%rcx
                \tadd \t$'0', %edx
                \tdec \t%rsi
                \tmov \t%dl, (%rsi)  
                \ttest\t%rax, %rax
                \tjnz \t.Ltoascii_digit
                \ttestl\t%ebx, %ebx
                \tjns \t.print_uint64_end
                \txor \t%edx, %edx
                \tdiv \t%rcx
                \tadd \t$'-', %edx
                \tdec \t%rsi
                \tmov \t%dl, (%rsi)  
                \ttest \t%rax, %rax
                    
                .print_uint64_end:
                \tmov \t$0x02000004, %eax
                \tmov \t$1, %edi
                \tmov \t%rsp, %rdx
                \tsub \t%rsi, %rdx
                \tsyscall
                \tret
                """;
    }

    private String printBooleanFunction() {
        return """
                /**
                 * Prints a boolean to stdout
                 * Params:
                 * - %rbx: Boolean value
                 */
                print_boolean:
                \ttestl\t%ebx, %ebx
                \tjnz \t.print_boolean_true
                \tmovq\tdecl_1@GOTPCREL(%rip), %rsi
                \tjmp \t.print_boolean_end
                \t.print_boolean_true:
                \t\tmovq\tdecl_0@GOTPCREL(%rip), %rsi
                \t.print_boolean_end:
                \t\tcall \tprint_string
                \t\tret
                """;
    }

    private String printStringFunction() {
        return """
                /**
                 * Prints a string to stdout
                 * Params:
                 * - %rsi: String address
                 */
                print_string:
                \tcall\tstring_length
                \tmov \t$0x02000004, %rax
                \tmov \t$1, %rdi
                \tsyscall
                \tret
                """;
    }

    private String stringLengthFunction() {
        return """
                /**
                 * Returns a string's length (saves to %rdx)
                 * Params:
                 * - %rsi: String address
                 * https://stackoverflow.com/questions/60482733/how-to-traverse-a-string-in-assembly-until-i-reach-null-strlen-loop
                 */
                string_length:
                \tlea \t-1(%rsi), %rdx
                \t.Lloop:
                \t\tinc \t%rdx
                \t\tcmpb\t$0, (%rdx)
                \t\tjne \t.Lloop
                \tsub \t%rsi, %rdx
                \tret
                """;
    }

    @Override
    public String epilogue() {
        StringBuilder epilogue = new StringBuilder(".section __DATA, __data\n");
        for (String declaration : constantDeclarations) {
            epilogue.append("\t").append(declaration);
        }
        return epilogue.toString();
    }

    @Override
    public String generate(AddInstruction tacInstruction) {
        return String.format("""
                       %s
                       %s
                       \taddq\t%%rbx, %%rax
                       %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rax"),
                loadInstruction(tacInstruction.getThirdReference(), "%rbx"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(CopyInstruction tacInstruction) {
        return String.format("""
                        %s
                        %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rax"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(DivideInstruction tacInstruction) {
        return String.format("""
                        %s
                        \tmovq\t%%rax, %%rdx
                        \tsarq\t$31, %%rdx
                        %s
                        \tidivq\t%%rbx
                        %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rax"),
                loadInstruction(tacInstruction.getThirdReference(), "%rbx"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(ModuloInstruction tacInstruction) {
        return String.format("""
                        %s
                        \tmovq\t%%rax, %%rdx
                        \tsarq\t$31, %%rdx
                        %s
                        \tidivq\t%%rbx
                        %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rax"),
                loadInstruction(tacInstruction.getThirdReference(), "%rbx"),
                storeInstruction("%rdx", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(NegativeInstruction tacInstruction) {
        return String.format("""
                        \txorq \t%%rax, %%rax
                        %s
                        \tsubq\t%%rbx, %%rax
                        %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rbx"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(ProductInstruction tacInstruction) {
        return String.format("""
                        %s
                        %s
                        \timulq\t%%rbx, %%rax
                        %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rax"),
                loadInstruction(tacInstruction.getThirdReference(), "%rbx"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(SubtractInstruction tacInstruction) {
        return String.format("""
                        %s
                        %s
                        \tsubq\t%%rbx, %%rax
                        %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rax"),
                loadInstruction(tacInstruction.getThirdReference(), "%rbx"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(IfDiff tacInstruction) {
        return generateIfInstruction(tacInstruction, "je");
    }

    @Override
    public String generate(IfEqual tacInstruction) {
        return generateIfInstruction(tacInstruction, "jne");
    }

    @Override
    public String generate(IfGEQ tacInstruction) {
        return generateIfInstruction(tacInstruction, "jl");
    }

    @Override
    public String generate(IfGreater tacInstruction) {
        return generateIfInstruction(tacInstruction, "jle");
    }

    @Override
    public String generate(IfLEQ tacInstruction) {
        return generateIfInstruction(tacInstruction, "ja");
    }

    @Override
    public String generate(IfLess tacInstruction) {
        return generateIfInstruction(tacInstruction, "jge");
    }

    @Override
    public String generate(GotoInstruction tacInstruction) {
        return "\tjmp \t" + tacInstruction.getFirstReference() + "\n";
    }

    @Override
    public String generate(SkipInstruction tacInstruction) {
        return tacInstruction.getFirstReference() + ":\n";
    }

    @Override
    public String generate(AndInstruction tacInstruction) {
        return String.format("""
                        %s
                        %s
                        \tandq\t%%rbx, %%rax
                        %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rax"),
                loadInstruction(tacInstruction.getThirdReference(), "%rbx"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(NotInstruction tacInstruction) {
        return String.format("""
                        %s
                        \tnotq\t%%rbx
                        %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rbx"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(OrInstruction tacInstruction) {
        return String.format("""
                        %s
                        %s
                        \torq\t%%rbx, %%rax
                        %s
                        """,
                loadInstruction(tacInstruction.getSecondReference(), "%rax"),
                loadInstruction(tacInstruction.getThirdReference(), "%rbx"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(IndexAssignmentInstruction tacInstruction) {
        return String.format("""
                        %s
                        %s
                        \tadd\t%%rbx, %%rcx
                        %s
                        \tmovl\t%%ebx, (%%rcx)
                        """,
                loadAddressInstruction(tacInstruction.getFirstReference(), "%rcx"),
                loadInstruction(tacInstruction.getSecondReference(), "%rbx"),
                loadInstruction(tacInstruction.getThirdReference(), "%rbx")
        );
    }

    @Override
    public String generate(IndexedValueInstruction tacInstruction) {
        return String.format("""
                        %s
                        %s
                        \taddq\t%%rbx, %%rax
                        \tmovq\t(%%rax), %%rax
                        %s
                        """,
                loadAddressInstruction(tacInstruction.getSecondReference(), "%rax"),
                loadAddressInstruction(tacInstruction.getThirdReference(), "%rbx"),
                storeInstruction("%rax", tacInstruction.getFirstReference())
        );
    }

    @Override
    public String generate(ProcedureCallInstruction tacInstruction) {
        SubprogramsTable subprogramsTable = Compiler.getCompiler().getSemanticAnalyzer().getSubprogramsTable();
        SubprogramsTable.SubprogramInfo subprogramInfo = subprogramsTable.get((TACSubprogram) tacInstruction.getFirstReference());
        return "\tcall\t" + subprogramInfo.getTag() + "\n";
    }

    @Override
    public String generate(FunctionCallInstruction tacInstruction) {
        return null;
    }

    @Override
    public String generate(ComplexParameterInstruction tacInstruction) {
        return null;
    }

    @Override
    public String generate(PreambleInstruction tacInstruction) {
        SubprogramsTable subprogramsTable = Compiler.getCompiler().getSemanticAnalyzer().getSubprogramsTable();
        SubprogramsTable.SubprogramInfo subprogramInfo = subprogramsTable.get((TACSubprogram) tacInstruction.getFirstReference());
        return String.format("""
                \tpush\t%%rbp
                \tmov \t%%rsp, %%rbp
                \tsubq\t$%s, %%rsp
                """,
                subprogramInfo.getLocalVariablesSize()
        );
    }

    @Override
    public String generate(ReturnInstruction tacInstruction) {
        return """
                \tmovq\t%rbp, %rsp
                \tpop \t%rbp
                \tret\n
                """;
    }

    @Override
    public String generate(SimpleParameterInstruction tacInstruction) {
        return String.format("""
                %s
                \tpush\t%%rax
                """,
                loadAddressInstruction(tacInstruction.getFirstReference(), "%rax")
        );
    }

    @Override
    public String generate(ReadInstruction tacInstruction) {
        return null;
    }

    @Override
    public String generate(PrintIntInstruction tacInstruction) {
        return String.format("""
                %s
                \tcall\tprint_uint64
                """,
                loadInstruction(tacInstruction.getFirstReference(), "%rdi")
        );
    }

    @Override
    public String generate(PrintBooleanInstruction tacInstruction) {
        return String.format("""
                %s
                \tcall\tprint_boolean
                """,
                loadInstruction(tacInstruction.getFirstReference(), "%rbx")
        );
    }

    @Override
    public String generate(PrintStringInstruction tacInstruction) {
        return String.format("""
                %s
                \tcall\tprint_string
                """, loadInstruction(tacInstruction.getFirstReference(), "%rsi"));
    }

    @Override
    public String generate(PrintArrayInstruction tacInstruction) {
        return null;
    }

    @Override
    public String generate(StringLengthInstruction tacInstruction) {
        return String.format("""
                %s
                \tcall\tstring_length
                \tsubq\t$1, %%rdx
                %s
                """,
                loadInstruction(tacInstruction.getSecondReference(), "%rsi"),
                storeInstruction("%rdx", tacInstruction.getFirstReference())
            );
    }

    private String loadInstruction(TACReference reference, String register) {
        if (reference instanceof TACLiteral) {
            if (((TACLiteral) reference).type().isString()) {
                return loadAddressInstruction(reference, register);
            }
            return String.format("\tmovq\t$%s, %s", reference, register);
        }
        VariablesTable.VariableInfo variableInfo = getVariableInfoOrThrowException(reference);
        if (isLocalVariable(variableInfo)) {
            return String.format("\tmovq\t%s(%%rbp), %s", variableInfo.getOffset(), register);
        } else if (isLocalArgument(variableInfo)) {
            return String.format("""
                    \tmovq\t%s(%%rbp), %%rsi
                    \tmovq\t(%%rsi), %s
                    """, variableInfo.getOffset() * 8, register);
        } else if (isGlobalVariable(variableInfo)) {
            return String.format("""
                    \tmovl\t$DISP, %%esi
                    \tmovl\t%s(%%esi), %%esi
                    \tmovl\t%s(%%esi), %s
                    """, variableInfo.getScope().getIndentation(), variableInfo.getOffset(), register);
        } else {
            throw new RuntimeException("Unidentifiable variable");
        }
    }

    private String storeInstruction(String register, TACReference reference) {
        VariablesTable.VariableInfo variableInfo = getVariableInfoOrThrowException(reference);
        if (isLocalVariable(variableInfo)) {
            return String.format("\tmovq\t%s, %s(%%rbp)", register, variableInfo.getOffset());
        } else if (isLocalArgument(variableInfo)) {
            return String.format("""
                    \tmovq\t%s(%%ebp), %%rdi
                    \tmovq\t%s, (%%rdi)
                    """, variableInfo.getOffset(), reference);
        } else if (isGlobalVariable(variableInfo)) {
            return String.format("""
                    \tmovl $DISP, %%esi
                    \tmovq\t%s(%%esi), %%rdi
                    \tmovq\t%s, %s(%%rdi)
                    """, variableInfo.getScope().getIndentation(), register, variableInfo.getOffset());
        } else {
            throw new RuntimeException("Unidentifiable variable");
        }
    }

    private String loadAddressInstruction(TACReference reference, String register) {
        if (reference instanceof TACLiteral) {
            String declarationName = "decl_" + constantDeclarations.size();
            String type = ((TACLiteral) reference).type().isString() ? "asciz" : "quad";
                constantDeclarations.add(String.format("%s: .%s %s\n", declarationName, type, reference));
            return String.format("\tmovq\t%s, %s", declarationName + "@GOTPCREL(%rip)", register);
        }
        VariablesTable.VariableInfo variableInfo = getVariableInfoOrThrowException(reference);
        if (isLocalVariable(variableInfo)) {
            return String.format("\tlea \t%s(%%rbp), %s", variableInfo.getOffset(), register);
        } else if (isLocalArgument(variableInfo)) {
            return String.format("\tmovq\t%s(%%rbp), %s", variableInfo.getOffset(), register);
        } else if (isGlobalVariable(variableInfo)) {
            return String.format("""
                    \tmovl $DISP, %%esi
                    \tmovl\t%s(%%esi), %%esi
                    \tmovl\t%s(%%esi), %s
                    """, variableInfo.getScope().getIndentation(), variableInfo.getOffset(), register);
        } else {
            throw new RuntimeException("Unidentifiable variable");
        }
    }

    private boolean isLocalVariable(VariablesTable.VariableInfo variableInfo) {
        return variableInfo.getScope().getIndentation() >= 1 && !variableInfo.isSubprogramArgument();
    }

    private boolean isLocalArgument(VariablesTable.VariableInfo variableInfo) {
        return variableInfo.getScope().getIndentation() >= 1 && variableInfo.isSubprogramArgument();
    }

    private boolean isGlobalVariable(VariablesTable.VariableInfo variableInfo) {
        return variableInfo.getScope().getIndentation() < 1 && !variableInfo.isSubprogramArgument();
    }

    private VariablesTable.VariableInfo getVariableInfoOrThrowException(TACReference reference) {
        VariablesTable variablesTable = Compiler.getCompiler().getSemanticAnalyzer().getVariablesTable();
        if (!(reference instanceof TACVariable)) {
            throw new RuntimeException(reference + " is not a TACVAriable");
        }
        VariablesTable.VariableInfo variableInfo = variablesTable.get((TACVariable) reference);
        if (variableInfo == null) {
            throw new RuntimeException("Variable not stored in variables table");
        }
        return variableInfo;
    }

    private String generateIfInstruction(IfInstruction tacInstruction, String comparisonCode) {
        return String.format("""
                        %s
                        %s
                        \tcmpq\t%%rbx, %%rax
                        \t%s \t1f
                        \tjmp\t%s
                        1:
                        """,
                loadInstruction(tacInstruction.getFirstReference(), "%rax"),
                loadInstruction(tacInstruction.getSecondReference(), "%rbx"),
                comparisonCode,
                tacInstruction.getThirdReference()
        );
    }
}
