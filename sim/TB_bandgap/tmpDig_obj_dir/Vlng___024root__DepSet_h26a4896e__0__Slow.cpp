// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlng.h for the primary calling header

#include "Vlng__pch.h"
#include "Vlng___024root.h"

VL_ATTR_COLD void Vlng___024root___eval_static(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_static\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vlng___024root___eval_initial(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_initial\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
    vlSelfRef.__Vtrigprevexpr___TOP__reset__0 = vlSelfRef.reset;
    vlSelfRef.__Vtrigprevexpr___TOP__cmp__0 = vlSelfRef.cmp;
    vlSelfRef.__Vtrigprevexpr___TOP__tmpDig__DOT__tmpCountRst__0 
        = vlSelfRef.tmpDig__DOT__tmpCountRst;
}

VL_ATTR_COLD void Vlng___024root___eval_final(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_final\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__stl(Vlng___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vlng___024root___eval_phase__stl(Vlng___024root* vlSelf);

VL_ATTR_COLD void Vlng___024root___eval_settle(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_settle\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VstlIterCount;
    CData/*0:0*/ __VstlContinue;
    // Body
    __VstlIterCount = 0U;
    vlSelfRef.__VstlFirstIteration = 1U;
    __VstlContinue = 1U;
    while (__VstlContinue) {
        if (VL_UNLIKELY((0x64U < __VstlIterCount))) {
#ifdef VL_DEBUG
            Vlng___024root___dump_triggers__stl(vlSelf);
#endif
            VL_FATAL_MT("../../rtl/tmpDig.v", 3, "", "Settle region did not converge.");
        }
        __VstlIterCount = ((IData)(1U) + __VstlIterCount);
        __VstlContinue = 0U;
        if (Vlng___024root___eval_phase__stl(vlSelf)) {
            __VstlContinue = 1U;
        }
        vlSelfRef.__VstlFirstIteration = 0U;
    }
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__stl(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___dump_triggers__stl\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VstlTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        VL_DBG_MSGF("         'stl' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vlng___024root___stl_sequent__TOP__0(Vlng___024root* vlSelf);

VL_ATTR_COLD void Vlng___024root___eval_stl(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_stl\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VstlTriggered.word(0U))) {
        Vlng___024root___stl_sequent__TOP__0(vlSelf);
    }
}

VL_ATTR_COLD void Vlng___024root___stl_sequent__TOP__0(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___stl_sequent__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.s_CmpOutDisable = vlSelfRef.tmpDig__DOT__CmpOutDisable_reg;
    vlSelfRef.tmpCount_out1 = vlSelfRef.tmpDig__DOT__tmpCount1;
    vlSelfRef.tmpCount_out2 = vlSelfRef.tmpDig__DOT__tmpCount2;
    vlSelfRef.cmp_p1 = ((IData)(vlSelfRef.tmpDig__DOT__enable_cmp_toggle)
                         ? (IData)(vlSelfRef.tmpDig__DOT__cmp_p1_async)
                         : (IData)(vlSelfRef.tmpDig__DOT__cmp_p1_fsm));
    vlSelfRef.cmp_p2 = (1U & (~ (IData)(vlSelfRef.cmp_p1)));
}

VL_ATTR_COLD void Vlng___024root___eval_triggers__stl(Vlng___024root* vlSelf);

VL_ATTR_COLD bool Vlng___024root___eval_phase__stl(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_phase__stl\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VstlExecute;
    // Body
    Vlng___024root___eval_triggers__stl(vlSelf);
    __VstlExecute = vlSelfRef.__VstlTriggered.any();
    if (__VstlExecute) {
        Vlng___024root___eval_stl(vlSelf);
    }
    return (__VstlExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__act(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___dump_triggers__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @(posedge clk or posedge reset)\n");
    }
    if ((2ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 1 is active: @(posedge clk)\n");
    }
    if ((4ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @(posedge cmp or posedge reset or posedge tmpDig.tmpCountRst)\n");
    }
    if ((8ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 3 is active: @(posedge clk or posedge cmp or posedge reset)\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__nba(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___dump_triggers__nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @(posedge clk or posedge reset)\n");
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 1 is active: @(posedge clk)\n");
    }
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @(posedge cmp or posedge reset or posedge tmpDig.tmpCountRst)\n");
    }
    if ((8ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 3 is active: @(posedge clk or posedge cmp or posedge reset)\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vlng___024root___ctor_var_reset(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___ctor_var_reset\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelf->clk = VL_RAND_RESET_I(1);
    vlSelf->reset = VL_RAND_RESET_I(1);
    vlSelf->cmp = VL_RAND_RESET_I(1);
    vlSelf->tmpPulse = VL_RAND_RESET_I(1);
    vlSelf->PI1 = VL_RAND_RESET_I(1);
    vlSelf->PI2 = VL_RAND_RESET_I(1);
    vlSelf->dummy = VL_RAND_RESET_I(1);
    vlSelf->PII1 = VL_RAND_RESET_I(1);
    vlSelf->PII2 = VL_RAND_RESET_I(1);
    vlSelf->PA = VL_RAND_RESET_I(1);
    vlSelf->PB = VL_RAND_RESET_I(1);
    vlSelf->PC = VL_RAND_RESET_I(1);
    vlSelf->PD = VL_RAND_RESET_I(1);
    vlSelf->s_BG2CMP = VL_RAND_RESET_I(1);
    vlSelf->s_BgCtrl = VL_RAND_RESET_I(1);
    vlSelf->s_PtatCtrl = VL_RAND_RESET_I(1);
    vlSelf->s_Cap2CMP = VL_RAND_RESET_I(1);
    vlSelf->s_Ref2CMP = VL_RAND_RESET_I(1);
    vlSelf->s_CapRst = VL_RAND_RESET_I(1);
    vlSelf->s_PtatOut = VL_RAND_RESET_I(1);
    vlSelf->s_Rdiscon_N = VL_RAND_RESET_I(1);
    vlSelf->s_CmpOutDisable = VL_RAND_RESET_I(1);
    vlSelf->src_n = VL_RAND_RESET_I(1);
    vlSelf->snk = VL_RAND_RESET_I(1);
    vlSelf->cmp_p1 = VL_RAND_RESET_I(1);
    vlSelf->cmp_p2 = VL_RAND_RESET_I(1);
    vlSelf->PwrUp = VL_RAND_RESET_I(1);
    vlSelf->rst = VL_RAND_RESET_I(1);
    vlSelf->valid = VL_RAND_RESET_I(1);
    vlSelf->preChrg = VL_RAND_RESET_I(1);
    vlSelf->setupBias = VL_RAND_RESET_I(1);
    vlSelf->tmpCount_out1 = VL_RAND_RESET_I(8);
    vlSelf->tmpCount_out2 = VL_RAND_RESET_I(8);
    vlSelf->tmpDig__DOT__afterBlank = VL_RAND_RESET_I(3);
    vlSelf->tmpDig__DOT__childState = VL_RAND_RESET_I(3);
    vlSelf->tmpDig__DOT__parentState = VL_RAND_RESET_I(3);
    vlSelf->tmpDig__DOT__count = VL_RAND_RESET_I(9);
    vlSelf->tmpDig__DOT__stateCount = VL_RAND_RESET_I(6);
    vlSelf->tmpDig__DOT__tmpCount1 = VL_RAND_RESET_I(8);
    vlSelf->tmpDig__DOT__tmpCount2 = VL_RAND_RESET_I(8);
    vlSelf->tmpDig__DOT__Hcharged = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__Lcharged = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__intermCmp = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__enable_cmp_toggle = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__cmp_p1_fsm = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__cmp_p1_async = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__CmpOutDisable_reg = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__CmpOutDisableCount = VL_RAND_RESET_I(2);
    vlSelf->tmpDig__DOT__lastPTATcmp = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__tmpCountRst = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__PI1 = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__PII1 = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__tmpDig__DOT__count = VL_RAND_RESET_I(9);
    vlSelf->__Vdly__tmpDig__DOT__stateCount = VL_RAND_RESET_I(6);
    vlSelf->__Vdly__tmpDig__DOT__Hcharged = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__tmpDig__DOT__Lcharged = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__tmpDig__DOT__intermCmp = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__tmpDig__DOT__lastPTATcmp = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__tmpDig__DOT__parentState = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__tmpDig__DOT__childState = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__tmpDig__DOT__afterBlank = VL_RAND_RESET_I(3);
    vlSelf->__Vdly__tmpDig__DOT__cmp_p1_fsm = VL_RAND_RESET_I(1);
    vlSelf->__Vdly__tmpDig__DOT__tmpCount2 = VL_RAND_RESET_I(8);
    vlSelf->__Vdly__tmpDig__DOT__tmpCount1 = VL_RAND_RESET_I(8);
    vlSelf->__Vtrigprevexpr___TOP__clk__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__reset__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__cmp__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__tmpDig__DOT__tmpCountRst__0 = VL_RAND_RESET_I(1);
}
