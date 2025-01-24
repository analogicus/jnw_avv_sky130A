// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlng.h for the primary calling header

#include "Vlng__pch.h"
#include "Vlng___024root.h"

void Vlng___024root___eval_act(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
}

void Vlng___024root___nba_sequent__TOP__0(Vlng___024root* vlSelf);
void Vlng___024root___nba_sequent__TOP__1(Vlng___024root* vlSelf);

void Vlng___024root___eval_nba(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__0(vlSelf);
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__1(vlSelf);
    }
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__0(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*5:0*/ __Vdly__chargePump__DOT__count2;
    __Vdly__chargePump__DOT__count2 = 0;
    // Body
    __Vdly__chargePump__DOT__count2 = vlSelfRef.chargePump__DOT__count2;
    if ((0xaU < (IData)(vlSelfRef.chargePump__DOT__count2))) {
        vlSelfRef.test = (1U & (~ (IData)(vlSelfRef.test)));
        __Vdly__chargePump__DOT__count2 = 0U;
    } else {
        __Vdly__chargePump__DOT__count2 = (0x3fU & 
                                           ((IData)(1U) 
                                            + (IData)(vlSelfRef.chargePump__DOT__count2)));
    }
    vlSelfRef.chargePump__DOT__count2 = __Vdly__chargePump__DOT__count2;
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__1(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__1\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*3:0*/ __Vdly__chargePump__DOT__state;
    __Vdly__chargePump__DOT__state = 0;
    CData/*0:0*/ __Vdly__snk;
    __Vdly__snk = 0;
    CData/*0:0*/ __Vdly__src_n;
    __Vdly__src_n = 0;
    CData/*5:0*/ __Vdly__chargePump__DOT__count;
    __Vdly__chargePump__DOT__count = 0;
    // Body
    __Vdly__chargePump__DOT__count = vlSelfRef.chargePump__DOT__count;
    __Vdly__src_n = vlSelfRef.src_n;
    __Vdly__snk = vlSelfRef.snk;
    __Vdly__chargePump__DOT__state = vlSelfRef.chargePump__DOT__state;
    if (vlSelfRef.reset) {
        vlSelfRef.rst = 1U;
        __Vdly__chargePump__DOT__state = 2U;
    } else {
        vlSelfRef.rst = 0U;
        if ((2U == (IData)(vlSelfRef.chargePump__DOT__state))) {
            vlSelfRef.preChrg = 1U;
            __Vdly__snk = 0U;
            __Vdly__src_n = 0U;
            if ((0xaU < (IData)(vlSelfRef.chargePump__DOT__count))) {
                __Vdly__chargePump__DOT__state = 0U;
                __Vdly__chargePump__DOT__count = 0U;
                vlSelfRef.preChrg = 0U;
            } else {
                __Vdly__chargePump__DOT__count = (0x3fU 
                                                  & ((IData)(1U) 
                                                     + (IData)(vlSelfRef.chargePump__DOT__count)));
            }
        } else if ((0U == (IData)(vlSelfRef.chargePump__DOT__state))) {
            __Vdly__snk = (1U & (~ (IData)(vlSelfRef.snk)));
            __Vdly__src_n = 0U;
            if ((5U < (IData)(vlSelfRef.chargePump__DOT__count))) {
                __Vdly__chargePump__DOT__count = 0U;
                __Vdly__chargePump__DOT__state = 1U;
            } else {
                __Vdly__chargePump__DOT__count = (0x3fU 
                                                  & ((IData)(1U) 
                                                     + (IData)(vlSelfRef.chargePump__DOT__count)));
            }
        } else if ((1U == (IData)(vlSelfRef.chargePump__DOT__state))) {
            __Vdly__src_n = (1U & (~ (IData)(vlSelfRef.src_n)));
            __Vdly__snk = 0U;
            if ((5U < (IData)(vlSelfRef.chargePump__DOT__count))) {
                __Vdly__chargePump__DOT__count = 0U;
                __Vdly__chargePump__DOT__state = 0U;
            } else {
                __Vdly__chargePump__DOT__count = (0x3fU 
                                                  & ((IData)(1U) 
                                                     + (IData)(vlSelfRef.chargePump__DOT__count)));
            }
        }
    }
    vlSelfRef.chargePump__DOT__state = __Vdly__chargePump__DOT__state;
    vlSelfRef.snk = __Vdly__snk;
    vlSelfRef.src_n = __Vdly__src_n;
    vlSelfRef.chargePump__DOT__count = __Vdly__chargePump__DOT__count;
}

void Vlng___024root___eval_triggers__act(Vlng___024root* vlSelf);

bool Vlng___024root___eval_phase__act(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_phase__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<2> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vlng___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vlng___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vlng___024root___eval_phase__nba(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_phase__nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vlng___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__nba(Vlng___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__act(Vlng___024root* vlSelf);
#endif  // VL_DEBUG

void Vlng___024root___eval(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vlng___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("../../rtl/chargePump.v", 3, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelfRef.__VactIterCount))) {
#ifdef VL_DEBUG
                Vlng___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("../../rtl/chargePump.v", 3, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vlng___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vlng___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vlng___024root___eval_debug_assertions(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_debug_assertions\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (VL_UNLIKELY((vlSelfRef.clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((vlSelfRef.reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
