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

void Vlng___024root___nba_sequent__TOP__1(Vlng___024root* vlSelf);
void Vlng___024root___nba_sequent__TOP__2(Vlng___024root* vlSelf);
void Vlng___024root___nba_sequent__TOP__3(Vlng___024root* vlSelf);
void Vlng___024root___nba_sequent__TOP__4(Vlng___024root* vlSelf);

void Vlng___024root___eval_nba(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__1(vlSelf);
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__2(vlSelf);
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__3(vlSelf);
    }
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__4(vlSelf);
    }
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__1(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__1\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*5:0*/ __Vdly__tmpDig__DOT__count;
    __Vdly__tmpDig__DOT__count = 0;
    CData/*0:0*/ __Vdly__tmpDig__DOT__outNxt;
    __Vdly__tmpDig__DOT__outNxt = 0;
    // Body
    __Vdly__tmpDig__DOT__outNxt = vlSelfRef.tmpDig__DOT__outNxt;
    __Vdly__tmpDig__DOT__count = vlSelfRef.tmpDig__DOT__count;
    vlSelfRef.__Vdly__tmpDig__DOT__state = vlSelfRef.tmpDig__DOT__state;
    if (vlSelfRef.rst) {
        vlSelfRef.__Vdly__tmpDig__DOT__state = 0U;
    } else if ((5U == (IData)(vlSelfRef.tmpDig__DOT__state))) {
        if (((3U < (IData)(vlSelfRef.tmpDig__DOT__count)) 
             & (IData)(vlSelfRef.tmpDig__DOT__cmpEvent))) {
            __Vdly__tmpDig__DOT__count = 0U;
            vlSelfRef.PD = 0U;
            vlSelfRef.PII1 = 0U;
            vlSelfRef.PII2 = 0U;
            vlSelfRef.__Vdly__tmpDig__DOT__state = 1U;
        } else {
            __Vdly__tmpDig__DOT__count = (0x3fU & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.tmpDig__DOT__count)));
            vlSelfRef.PD = 1U;
            vlSelfRef.PII1 = 1U;
            vlSelfRef.PII2 = 1U;
        }
    } else if ((2U == (IData)(vlSelfRef.tmpDig__DOT__state))) {
        if (vlSelfRef.tmpDig__DOT__cmpEvent) {
            vlSelfRef.PI1 = 0U;
            vlSelfRef.PI2 = 0U;
            if (vlSelfRef.tmpDig__DOT__Hnxt) {
                vlSelfRef.tmpDig__DOT__Hnxt = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__state = 3U;
            } else {
                vlSelfRef.tmpDig__DOT__Hnxt = 1U;
                vlSelfRef.__Vdly__tmpDig__DOT__state = 4U;
            }
        } else {
            vlSelfRef.PI1 = 1U;
            vlSelfRef.PI2 = 1U;
            vlSelfRef.__Vdly__tmpDig__DOT__state = 2U;
        }
    } else if ((1U == (IData)(vlSelfRef.tmpDig__DOT__state))) {
        if ((3U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
            __Vdly__tmpDig__DOT__count = 0U;
            vlSelfRef.PII1 = 0U;
            vlSelfRef.PII2 = 0U;
            vlSelfRef.__Vdly__tmpDig__DOT__state = 2U;
        } else {
            __Vdly__tmpDig__DOT__count = (0x3fU & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.tmpDig__DOT__count)));
            vlSelfRef.__Vdly__tmpDig__DOT__state = 1U;
            vlSelfRef.PII1 = 1U;
            vlSelfRef.PII2 = 1U;
        }
    } else if ((3U == (IData)(vlSelfRef.tmpDig__DOT__state))) {
        if ((3U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
            __Vdly__tmpDig__DOT__count = 0U;
            vlSelfRef.PA = 0U;
            vlSelfRef.PB = 0U;
            if (vlSelfRef.tmpDig__DOT__outNxt) {
                __Vdly__tmpDig__DOT__outNxt = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__state = 5U;
            } else {
                __Vdly__tmpDig__DOT__outNxt = 1U;
                vlSelfRef.__Vdly__tmpDig__DOT__state = 2U;
            }
        } else {
            __Vdly__tmpDig__DOT__count = (0x3fU & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.tmpDig__DOT__count)));
            vlSelfRef.PA = 1U;
            vlSelfRef.PB = 1U;
        }
    } else if ((4U == (IData)(vlSelfRef.tmpDig__DOT__state))) {
        if ((3U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
            __Vdly__tmpDig__DOT__count = 0U;
            vlSelfRef.PA = 0U;
            vlSelfRef.PC = 0U;
            if (vlSelfRef.tmpDig__DOT__outNxt) {
                __Vdly__tmpDig__DOT__outNxt = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__state = 5U;
            } else {
                __Vdly__tmpDig__DOT__outNxt = 1U;
                vlSelfRef.__Vdly__tmpDig__DOT__state = 2U;
            }
        } else {
            __Vdly__tmpDig__DOT__count = (0x3fU & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.tmpDig__DOT__count)));
            vlSelfRef.PA = 1U;
            vlSelfRef.PC = 1U;
        }
    } else if ((0U == (IData)(vlSelfRef.tmpDig__DOT__state))) {
        __Vdly__tmpDig__DOT__outNxt = 0U;
        vlSelfRef.tmpDig__DOT__Hnxt = 1U;
        vlSelfRef.PII1 = 0U;
        vlSelfRef.PII2 = 0U;
        vlSelfRef.PI1 = 0U;
        vlSelfRef.PI2 = 0U;
        vlSelfRef.PA = 0U;
        vlSelfRef.PB = 0U;
        vlSelfRef.PC = 0U;
        vlSelfRef.PD = 0U;
        vlSelfRef.valid = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__state = 1U;
    }
    vlSelfRef.tmpDig__DOT__count = __Vdly__tmpDig__DOT__count;
    vlSelfRef.tmpDig__DOT__outNxt = __Vdly__tmpDig__DOT__outNxt;
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__2(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__2\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.rst = vlSelfRef.reset;
}

extern const VlUnpacked<CData/*0:0*/, 32> Vlng__ConstPool__TABLE_hc9b12957_0;
extern const VlUnpacked<CData/*3:0*/, 32> Vlng__ConstPool__TABLE_h0d05b62a_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vlng__ConstPool__TABLE_h356319a5_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vlng__ConstPool__TABLE_hbaba128a_0;
extern const VlUnpacked<CData/*0:0*/, 32> Vlng__ConstPool__TABLE_h0290ce37_0;

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__3(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__3\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*4:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    // Body
    __Vtableidx1 = (((IData)(vlSelfRef.tmpDig__DOT__prevCmp) 
                     << 4U) | (((IData)(vlSelfRef.cmp) 
                                << 3U) | (IData)(vlSelfRef.tmpDig__DOT__state)));
    vlSelfRef.tmpDig__DOT__cmpEvent = Vlng__ConstPool__TABLE_hc9b12957_0
        [__Vtableidx1];
    if ((2U & Vlng__ConstPool__TABLE_h0d05b62a_0[__Vtableidx1])) {
        vlSelfRef.snk = Vlng__ConstPool__TABLE_h356319a5_0
            [__Vtableidx1];
    }
    if ((4U & Vlng__ConstPool__TABLE_h0d05b62a_0[__Vtableidx1])) {
        vlSelfRef.src = Vlng__ConstPool__TABLE_hbaba128a_0
            [__Vtableidx1];
    }
    vlSelfRef.tmpDig__DOT__prevCmp = Vlng__ConstPool__TABLE_h0290ce37_0
        [__Vtableidx1];
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__4(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__4\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tmpDig__DOT__state = vlSelfRef.__Vdly__tmpDig__DOT__state;
}

void Vlng___024root___eval_triggers__act(Vlng___024root* vlSelf);

bool Vlng___024root___eval_phase__act(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_phase__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<3> __VpreTriggered;
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
            VL_FATAL_MT("../../rtl/tmpDig.v", 3, "", "NBA region did not converge.");
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
                VL_FATAL_MT("../../rtl/tmpDig.v", 3, "", "Active region did not converge.");
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
    if (VL_UNLIKELY((vlSelfRef.cmp & 0xfeU))) {
        Verilated::overWidthError("cmp");}
}
#endif  // VL_DEBUG
