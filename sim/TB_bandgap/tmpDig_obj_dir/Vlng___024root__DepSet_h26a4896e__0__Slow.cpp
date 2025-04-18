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

VL_ATTR_COLD void Vlng___024root___eval_initial__TOP(Vlng___024root* vlSelf);

VL_ATTR_COLD void Vlng___024root___eval_initial(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_initial\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vlng___024root___eval_initial__TOP(vlSelf);
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
    vlSelfRef.__Vtrigprevexpr___TOP__reset__0 = vlSelfRef.reset;
    vlSelfRef.__Vtrigprevexpr___TOP__tmpDig__DOT__snk_ctrl__0 = 0U;
    vlSelfRef.__Vtrigprevexpr___TOP__tmpDig__DOT__src_ctrl__0 = 0U;
}

VL_ATTR_COLD void Vlng___024root___eval_initial__TOP(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_initial__TOP\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tmpDig__DOT__state = 0U;
    vlSelfRef.cmp_p1 = 1U;
    vlSelfRef.cmp_p2 = 0U;
    vlSelfRef.tmpDig__DOT__snk_ctrl = 0U;
    vlSelfRef.tmpDig__DOT__src_ctrl = 0U;
    vlSelfRef.s_BG2CMP = 0U;
    vlSelfRef.s_BgCtrl = 0U;
    vlSelfRef.s_PtatCtrl = 0U;
    vlSelfRef.s_Cap2CMP = 0U;
    vlSelfRef.s_Ref2CMP = 0U;
    vlSelfRef.s_CapRst = 0U;
    vlSelfRef.s_PtatOut = 0U;
    vlSelfRef.s_Rdiscon_N = 1U;
    vlSelfRef.preChrg = 0U;
    vlSelfRef.setupBias = 0U;
    vlSelfRef.tmpDig__DOT__setupDone = 0U;
    vlSelfRef.tmpDig__DOT__count = 0U;
}

VL_ATTR_COLD void Vlng___024root___eval_final(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_final\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vlng___024root___eval_settle(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_settle\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
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
        VL_DBG_MSGF("         'act' region trigger index 2 is active: @(negedge clk or [changed] tmpDig.snk_ctrl)\n");
    }
    if ((8ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 3 is active: @(negedge clk or [changed] tmpDig.src_ctrl)\n");
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
        VL_DBG_MSGF("         'nba' region trigger index 2 is active: @(negedge clk or [changed] tmpDig.snk_ctrl)\n");
    }
    if ((8ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 3 is active: @(negedge clk or [changed] tmpDig.src_ctrl)\n");
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
    vlSelf->PI1 = VL_RAND_RESET_I(1);
    vlSelf->PI2 = VL_RAND_RESET_I(1);
    vlSelf->PII1 = VL_RAND_RESET_I(1);
    vlSelf->dummy = VL_RAND_RESET_I(1);
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
    vlSelf->src_n = VL_RAND_RESET_I(1);
    vlSelf->snk = VL_RAND_RESET_I(1);
    vlSelf->cmp_p1 = VL_RAND_RESET_I(1);
    vlSelf->cmp_p2 = VL_RAND_RESET_I(1);
    vlSelf->rst = VL_RAND_RESET_I(1);
    vlSelf->valid = VL_RAND_RESET_I(1);
    vlSelf->preChrg = VL_RAND_RESET_I(1);
    vlSelf->setupBias = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__state = VL_RAND_RESET_I(4);
    vlSelf->tmpDig__DOT__afterBlank = VL_RAND_RESET_I(4);
    vlSelf->tmpDig__DOT__count = VL_RAND_RESET_I(6);
    vlSelf->tmpDig__DOT__setupCount = VL_RAND_RESET_I(6);
    vlSelf->tmpDig__DOT__Hcharged = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__Lcharged = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__setupDone = VL_RAND_RESET_I(7);
    vlSelf->tmpDig__DOT__snk_ctrl = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__src_ctrl = VL_RAND_RESET_I(1);
    vlSelf->tmpDig__DOT__intermCmp = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__clk__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__reset__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__tmpDig__DOT__snk_ctrl__0 = VL_RAND_RESET_I(1);
    vlSelf->__Vtrigprevexpr___TOP__tmpDig__DOT__src_ctrl__0 = VL_RAND_RESET_I(1);
    vlSelf->__VactDidInit = 0;
}
