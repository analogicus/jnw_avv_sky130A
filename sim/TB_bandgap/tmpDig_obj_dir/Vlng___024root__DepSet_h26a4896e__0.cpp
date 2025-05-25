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
void Vlng___024root___nba_sequent__TOP__5(Vlng___024root* vlSelf);
void Vlng___024root___nba_sequent__TOP__6(Vlng___024root* vlSelf);
void Vlng___024root___nba_comb__TOP__0(Vlng___024root* vlSelf);

void Vlng___024root___eval_nba(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_nba\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__1(vlSelf);
    }
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__2(vlSelf);
    }
    if ((8ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__3(vlSelf);
    }
    if ((2ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__4(vlSelf);
    }
    if ((4ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__5(vlSelf);
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_sequent__TOP__6(vlSelf);
    }
    if ((6ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        Vlng___024root___nba_comb__TOP__0(vlSelf);
    }
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__1(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__1\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = vlSelfRef.tmpDig__DOT__afterBlank;
    vlSelfRef.__Vdly__tmpDig__DOT__childState = vlSelfRef.tmpDig__DOT__childState;
    vlSelfRef.__Vdly__tmpDig__DOT__parentState = vlSelfRef.tmpDig__DOT__parentState;
    vlSelfRef.__Vdly__tmpDig__DOT__lastPTATcmp = vlSelfRef.tmpDig__DOT__lastPTATcmp;
    vlSelfRef.__Vdly__tmpDig__DOT__intermCmp = vlSelfRef.tmpDig__DOT__intermCmp;
    vlSelfRef.__Vdly__tmpDig__DOT__Lcharged = vlSelfRef.tmpDig__DOT__Lcharged;
    vlSelfRef.__Vdly__tmpDig__DOT__Hcharged = vlSelfRef.tmpDig__DOT__Hcharged;
    vlSelfRef.__Vdly__tmpDig__DOT__stateCount = vlSelfRef.tmpDig__DOT__stateCount;
    vlSelfRef.__Vdly__tmpDig__DOT__count = vlSelfRef.tmpDig__DOT__count;
    vlSelfRef.__Vdly__PII1 = vlSelfRef.PII1;
    vlSelfRef.__Vdly__PI1 = vlSelfRef.PI1;
    vlSelfRef.__Vdly__tmpDig__DOT__cmp_p1_fsm = vlSelfRef.tmpDig__DOT__cmp_p1_fsm;
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__2(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__2\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __Vdly__tmpDig__DOT__cmp_p1_async;
    __Vdly__tmpDig__DOT__cmp_p1_async = 0;
    // Body
    __Vdly__tmpDig__DOT__cmp_p1_async = vlSelfRef.tmpDig__DOT__cmp_p1_async;
    vlSelfRef.__Vdly__tmpDig__DOT__tmpCount1 = vlSelfRef.tmpDig__DOT__tmpCount1;
    vlSelfRef.__Vdly__tmpDig__DOT__tmpCount2 = vlSelfRef.tmpDig__DOT__tmpCount2;
    vlSelfRef.__Vdly__tmpDig__DOT__tmpCount3 = vlSelfRef.tmpDig__DOT__tmpCount3;
    vlSelfRef.__Vdly__tmpDig__DOT__tmpCount4 = vlSelfRef.tmpDig__DOT__tmpCount4;
    if (vlSelfRef.reset) {
        __Vdly__tmpDig__DOT__cmp_p1_async = 1U;
        vlSelfRef.__Vdly__tmpDig__DOT__tmpCount1 = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__tmpCount2 = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__tmpCount3 = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__tmpCount4 = 0U;
    } else if (((IData)(vlSelfRef.tmpDig__DOT__enable_cmp_toggle) 
                & (~ (IData)(vlSelfRef.tmpDig__DOT__CmpOutDisable_reg)))) {
        __Vdly__tmpDig__DOT__cmp_p1_async = (1U & (~ (IData)(vlSelfRef.tmpDig__DOT__cmp_p1_async)));
        if (vlSelfRef.tmpDig__DOT__lastPTATcmp) {
            vlSelfRef.__Vdly__tmpDig__DOT__tmpCount1 
                = (0xffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__tmpCount1)));
            vlSelfRef.__Vdly__tmpDig__DOT__tmpCount3 
                = (0xffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__tmpCount3)));
        }
        if ((1U & (~ (IData)(vlSelfRef.tmpDig__DOT__lastPTATcmp)))) {
            vlSelfRef.__Vdly__tmpDig__DOT__tmpCount2 
                = (0xffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__tmpCount2)));
            vlSelfRef.__Vdly__tmpDig__DOT__tmpCount4 
                = (0xffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__tmpCount4)));
        }
    } else if (vlSelfRef.tmpDig__DOT__tmpCountRst) {
        vlSelfRef.__Vdly__tmpDig__DOT__tmpCount1 = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__tmpCount2 = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__tmpCount3 = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__tmpCount4 = 0U;
    }
    vlSelfRef.tmpDig__DOT__cmp_p1_async = __Vdly__tmpDig__DOT__cmp_p1_async;
}

extern const VlUnpacked<CData/*1:0*/, 256> Vlng__ConstPool__TABLE_h69f8f00e_0;
extern const VlUnpacked<CData/*0:0*/, 256> Vlng__ConstPool__TABLE_hb0931d02_0;
extern const VlUnpacked<CData/*1:0*/, 256> Vlng__ConstPool__TABLE_hc5ca88f0_0;

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__3(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__3\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*7:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    // Body
    __Vtableidx1 = (((IData)(vlSelfRef.tmpDig__DOT__parentState) 
                     << 5U) | (((IData)(vlSelfRef.cmp) 
                                << 4U) | (((IData)(vlSelfRef.tmpDig__DOT__CmpOutDisableCount) 
                                           << 2U) | 
                                          (((IData)(vlSelfRef.s_CmpOutDisable) 
                                            << 1U) 
                                           | (IData)(vlSelfRef.reset)))));
    if ((1U & Vlng__ConstPool__TABLE_h69f8f00e_0[__Vtableidx1])) {
        vlSelfRef.tmpDig__DOT__CmpOutDisable_reg = 
            Vlng__ConstPool__TABLE_hb0931d02_0[__Vtableidx1];
    }
    if ((2U & Vlng__ConstPool__TABLE_h69f8f00e_0[__Vtableidx1])) {
        vlSelfRef.tmpDig__DOT__CmpOutDisableCount = 
            Vlng__ConstPool__TABLE_hc5ca88f0_0[__Vtableidx1];
    }
    vlSelfRef.s_CmpOutDisable = vlSelfRef.tmpDig__DOT__CmpOutDisable_reg;
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__4(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__4\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if (vlSelfRef.tmpDig__DOT__rst) {
        vlSelfRef.__Vdly__PI1 = 0U;
        vlSelfRef.PI2 = 0U;
        vlSelfRef.__Vdly__PII1 = 0U;
        vlSelfRef.PII2 = 0U;
        vlSelfRef.PA = 0U;
        vlSelfRef.PB = 0U;
        vlSelfRef.PC = 0U;
        vlSelfRef.PD = 0U;
        vlSelfRef.s_BgCtrl = 0U;
        vlSelfRef.s_PtatCtrl = 0U;
        vlSelfRef.s_BG2CMP = 0U;
        vlSelfRef.s_Cap2CMP = 0U;
        vlSelfRef.s_Ref2CMP = 0U;
        vlSelfRef.s_CapRst = 0U;
        vlSelfRef.s_PtatOut = 0U;
        vlSelfRef.s_Rdiscon_N = 0U;
        vlSelfRef.src_n = 0U;
        vlSelfRef.snk = 0U;
        vlSelfRef.PwrUp = 0U;
        vlSelfRef.preChrg = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__stateCount = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__Hcharged = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__Lcharged = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__intermCmp = 0U;
        vlSelfRef.tmpDig__DOT__enable_cmp_toggle = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__lastPTATcmp = 0U;
        vlSelfRef.tmpDig__DOT__tmpCountRst = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
        vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
    } else if ((5U == (IData)(vlSelfRef.tmpDig__DOT__parentState))) {
        vlSelfRef.s_BgCtrl = 1U;
        vlSelfRef.s_Rdiscon_N = 1U;
        vlSelfRef.s_BG2CMP = 1U;
        if ((4U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            if ((2U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.PA = 0U;
                    vlSelfRef.PB = 0U;
                    vlSelfRef.PC = 0U;
                    vlSelfRef.PD = 0U;
                    if ((2U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__intermCmp 
                            = vlSelfRef.cmp;
                        vlSelfRef.__Vdly__PI1 = 1U;
                    } else {
                        vlSelfRef.__Vdly__PI1 = 0U;
                    }
                    vlSelfRef.__Vdly__tmpDig__DOT__childState 
                        = vlSelfRef.tmpDig__DOT__afterBlank;
                    if ((6U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 1U;
                    }
                } else {
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.PA = 0U;
                    vlSelfRef.PB = 0U;
                    vlSelfRef.PC = 0U;
                    vlSelfRef.PD = 0U;
                    vlSelfRef.__Vdly__PII1 = (1U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank));
                    vlSelfRef.__Vdly__tmpDig__DOT__childState 
                        = vlSelfRef.tmpDig__DOT__afterBlank;
                    if ((7U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
                    }
                }
            } else if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                vlSelfRef.__Vdly__tmpDig__DOT__count 
                    = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                vlSelfRef.PA = 1U;
                vlSelfRef.PB = 1U;
                vlSelfRef.PC = 1U;
                vlSelfRef.PD = 1U;
                if ((0xfU < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
                    vlSelfRef.__Vdly__tmpDig__DOT__parentState = 2U;
                    vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
                    vlSelfRef.__Vdly__tmpDig__DOT__stateCount = 0U;
                    vlSelfRef.PA = 0U;
                    vlSelfRef.PB = 0U;
                    vlSelfRef.PC = 0U;
                    vlSelfRef.PD = 0U;
                } else {
                    vlSelfRef.__Vdly__tmpDig__DOT__childState = 5U;
                }
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
            }
        } else if ((2U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__count 
                    = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                vlSelfRef.PI2 = 1U;
                if (((IData)(vlSelfRef.cmp) == (IData)(vlSelfRef.tmpDig__DOT__intermCmp))) {
                    if (vlSelfRef.cmp) {
                        vlSelfRef.src_n = 1U;
                        vlSelfRef.snk = 0U;
                    } else {
                        vlSelfRef.__Vdly__tmpDig__DOT__stateCount 
                            = (0x3fU & ((IData)(1U) 
                                        + (IData)(vlSelfRef.tmpDig__DOT__stateCount)));
                        vlSelfRef.src_n = 0U;
                        vlSelfRef.snk = 1U;
                    }
                } else if ((5U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                    if ((1U < (IData)(vlSelfRef.tmpDig__DOT__stateCount))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 5U;
                        vlSelfRef.__Vdly__tmpDig__DOT__stateCount = 0U;
                    } else {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 6U;
                    }
                    vlSelfRef.snk = 0U;
                    vlSelfRef.src_n = 0U;
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
                    vlSelfRef.PI2 = 0U;
                } else {
                    vlSelfRef.__Vdly__tmpDig__DOT__count 
                        = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                }
            }
        } else if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            vlSelfRef.__Vdly__tmpDig__DOT__count = 
                (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
            vlSelfRef.PII2 = 1U;
            if ((1U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                vlSelfRef.__Vdly__tmpDig__DOT__cmp_p1_fsm 
                    = (1U & (~ (IData)(vlSelfRef.tmpDig__DOT__cmp_p1_fsm)));
                vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 7U;
                vlSelfRef.PII2 = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 6U;
            }
        } else {
            vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
        }
    } else if ((2U == (IData)(vlSelfRef.tmpDig__DOT__parentState))) {
        vlSelfRef.s_BgCtrl = 1U;
        vlSelfRef.s_BG2CMP = 1U;
        vlSelfRef.s_Rdiscon_N = 1U;
        if ((4U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            if ((2U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.PA = 0U;
                    vlSelfRef.PB = 0U;
                    vlSelfRef.PC = 0U;
                    vlSelfRef.PD = 0U;
                    if ((2U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__intermCmp 
                            = vlSelfRef.cmp;
                        vlSelfRef.__Vdly__PI1 = 1U;
                    } else {
                        vlSelfRef.__Vdly__PI1 = 0U;
                    }
                    vlSelfRef.__Vdly__tmpDig__DOT__childState 
                        = vlSelfRef.tmpDig__DOT__afterBlank;
                    if ((6U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 1U;
                    }
                } else {
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.PA = 0U;
                    vlSelfRef.PB = 0U;
                    vlSelfRef.PC = 0U;
                    vlSelfRef.PD = 0U;
                    vlSelfRef.__Vdly__PII1 = (1U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank));
                    vlSelfRef.__Vdly__tmpDig__DOT__childState 
                        = vlSelfRef.tmpDig__DOT__afterBlank;
                    if ((7U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
                    }
                }
            } else if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                vlSelfRef.PB = 1U;
                vlSelfRef.__Vdly__tmpDig__DOT__Lcharged = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__Hcharged = 0U;
                vlSelfRef.PC = 1U;
                vlSelfRef.PD = 1U;
                if ((3U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.__Vdly__tmpDig__DOT__stateCount 
                        = (0x3fU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__stateCount)));
                    if ((0xaU < (IData)(vlSelfRef.tmpDig__DOT__stateCount))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 7U;
                        vlSelfRef.__Vdly__tmpDig__DOT__parentState = 3U;
                        vlSelfRef.__Vdly__tmpDig__DOT__childState = 6U;
                        vlSelfRef.__Vdly__tmpDig__DOT__stateCount = 0U;
                        vlSelfRef.s_BgCtrl = 0U;
                        vlSelfRef.s_Rdiscon_N = 0U;
                        vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                        vlSelfRef.PA = 0U;
                        vlSelfRef.PB = 0U;
                        vlSelfRef.PC = 0U;
                        vlSelfRef.PD = 0U;
                    } else {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
                        vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
                    }
                } else {
                    vlSelfRef.__Vdly__tmpDig__DOT__count 
                        = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                }
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__count 
                    = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                vlSelfRef.PA = 1U;
                vlSelfRef.PC = 1U;
                if ((4U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.__Vdly__tmpDig__DOT__intermCmp 
                        = vlSelfRef.cmp;
                    if (vlSelfRef.tmpDig__DOT__Hcharged) {
                        vlSelfRef.PA = 0U;
                        vlSelfRef.PC = 0U;
                        vlSelfRef.__Vdly__tmpDig__DOT__childState = 5U;
                    } else {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
                        vlSelfRef.__Vdly__tmpDig__DOT__Lcharged = 1U;
                        vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
                    }
                }
            }
        } else if ((2U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                vlSelfRef.__Vdly__tmpDig__DOT__count 
                    = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                vlSelfRef.PA = 1U;
                vlSelfRef.PB = 1U;
                if ((4U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__intermCmp 
                        = vlSelfRef.cmp;
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    if (vlSelfRef.tmpDig__DOT__Lcharged) {
                        vlSelfRef.__Vdly__tmpDig__DOT__childState = 5U;
                        vlSelfRef.PA = 0U;
                        vlSelfRef.PB = 0U;
                    } else {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
                        vlSelfRef.__Vdly__tmpDig__DOT__Hcharged = 1U;
                        vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
                    }
                }
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__count 
                    = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                vlSelfRef.PI2 = 1U;
                if (((IData)(vlSelfRef.cmp) == (IData)(vlSelfRef.tmpDig__DOT__intermCmp))) {
                    if (vlSelfRef.cmp) {
                        vlSelfRef.src_n = 1U;
                        vlSelfRef.snk = 0U;
                    } else {
                        vlSelfRef.src_n = 0U;
                        vlSelfRef.snk = 1U;
                    }
                } else if ((5U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 6U;
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.PI2 = 0U;
                    vlSelfRef.snk = 0U;
                    vlSelfRef.src_n = 0U;
                    vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
                } else {
                    vlSelfRef.__Vdly__tmpDig__DOT__count 
                        = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                }
            }
        } else if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            vlSelfRef.__Vdly__tmpDig__DOT__count = 
                (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
            vlSelfRef.PII2 = 1U;
            if ((4U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                vlSelfRef.__Vdly__tmpDig__DOT__cmp_p1_fsm 
                    = (1U & (~ (IData)(vlSelfRef.tmpDig__DOT__cmp_p1_fsm)));
                vlSelfRef.PII2 = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 6U;
                vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 5U;
                if (vlSelfRef.tmpDig__DOT__Hcharged) {
                    vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 4U;
                    vlSelfRef.__Vdly__tmpDig__DOT__childState = 6U;
                } else {
                    vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 3U;
                    vlSelfRef.__Vdly__tmpDig__DOT__childState = 6U;
                }
            }
        } else {
            vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
        }
    } else if ((3U == (IData)(vlSelfRef.tmpDig__DOT__parentState))) {
        vlSelfRef.s_PtatCtrl = 1U;
        vlSelfRef.s_Rdiscon_N = 0U;
        vlSelfRef.s_BG2CMP = 1U;
        if ((4U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            if ((2U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.PA = 0U;
                    vlSelfRef.PB = 0U;
                    vlSelfRef.PC = 0U;
                    vlSelfRef.PD = 0U;
                    if ((2U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__intermCmp 
                            = vlSelfRef.cmp;
                        vlSelfRef.__Vdly__PI1 = 1U;
                    } else {
                        vlSelfRef.__Vdly__PI1 = 0U;
                    }
                    vlSelfRef.__Vdly__tmpDig__DOT__childState 
                        = vlSelfRef.tmpDig__DOT__afterBlank;
                    if ((6U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 1U;
                    }
                } else {
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    if ((1U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__PII1 = 1U;
                    } else {
                        vlSelfRef.__Vdly__PII1 = 0U;
                        if (((4U < (IData)(vlSelfRef.tmpDig__DOT__stateCount)) 
                             & ((IData)(vlSelfRef.cmp) 
                                != (IData)(vlSelfRef.tmpDig__DOT__lastPTATcmp)))) {
                            vlSelfRef.__Vdly__tmpDig__DOT__lastPTATcmp 
                                = vlSelfRef.cmp;
                            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 4U;
                            vlSelfRef.s_BG2CMP = 0U;
                            vlSelfRef.s_CapRst = 1U;
                            vlSelfRef.s_PtatOut = 1U;
                            vlSelfRef.__Vdly__tmpDig__DOT__stateCount = 0U;
                        }
                    }
                    vlSelfRef.__Vdly__tmpDig__DOT__childState 
                        = vlSelfRef.tmpDig__DOT__afterBlank;
                    if ((7U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                        vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
                    }
                }
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
            }
        } else if ((2U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__count 
                    = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                vlSelfRef.PI2 = 1U;
                if (((IData)(vlSelfRef.cmp) == (IData)(vlSelfRef.tmpDig__DOT__intermCmp))) {
                    if (vlSelfRef.cmp) {
                        vlSelfRef.src_n = 1U;
                        vlSelfRef.snk = 0U;
                    } else {
                        vlSelfRef.src_n = 0U;
                        vlSelfRef.snk = 1U;
                    }
                } else if ((5U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 6U;
                    vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                    vlSelfRef.PI2 = 0U;
                    vlSelfRef.snk = 0U;
                    vlSelfRef.src_n = 0U;
                    vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
                } else {
                    vlSelfRef.__Vdly__tmpDig__DOT__count 
                        = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
                }
            }
        } else if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            vlSelfRef.PII2 = 1U;
            if ((0xfU < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                vlSelfRef.__Vdly__tmpDig__DOT__stateCount 
                    = (0x3fU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__stateCount)));
                vlSelfRef.__Vdly__tmpDig__DOT__cmp_p1_fsm 
                    = (1U & (~ (IData)(vlSelfRef.tmpDig__DOT__cmp_p1_fsm)));
                vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 7U;
                vlSelfRef.PII2 = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 6U;
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__count 
                    = (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
            }
        } else {
            vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
        }
    } else if ((4U == (IData)(vlSelfRef.tmpDig__DOT__parentState))) {
        vlSelfRef.s_PtatCtrl = 1U;
        vlSelfRef.tmpDig__DOT__tmpCountRst = 0U;
        vlSelfRef.s_CapRst = 0U;
        vlSelfRef.s_Cap2CMP = 1U;
        vlSelfRef.s_Ref2CMP = 1U;
        vlSelfRef.__Vdly__tmpDig__DOT__count = (0x3ffU 
                                                & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.tmpDig__DOT__count)));
        vlSelfRef.tmpDig__DOT__enable_cmp_toggle = 1U;
        if ((0x3e8U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 0U;
            vlSelfRef.tmpDig__DOT__enable_cmp_toggle = 0U;
            vlSelfRef.s_PtatCtrl = 0U;
            vlSelfRef.s_BgCtrl = 0U;
            vlSelfRef.s_Cap2CMP = 0U;
            vlSelfRef.s_Ref2CMP = 0U;
            vlSelfRef.s_CapRst = 1U;
            vlSelfRef.s_PtatOut = 0U;
            vlSelfRef.s_Rdiscon_N = 1U;
            vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
        } else {
            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 4U;
        }
    } else if ((0U == (IData)(vlSelfRef.tmpDig__DOT__parentState))) {
        vlSelfRef.__Vdly__tmpDig__DOT__count = (0x3ffU 
                                                & ((IData)(1U) 
                                                   + (IData)(vlSelfRef.tmpDig__DOT__count)));
        vlSelfRef.PwrUp = 0U;
        if ((0x1eU < (IData)(vlSelfRef.tmpDig__DOT__count))) {
            vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 2U;
            vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
            vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
            vlSelfRef.PwrUp = 1U;
            if (((((0U < (IData)(vlSelfRef.tmpDig__DOT__tmpCount1)) 
                   & (0U < (IData)(vlSelfRef.tmpDig__DOT__tmpCount2))) 
                  & (0U < (IData)(vlSelfRef.tmpDig__DOT__tmpCount3))) 
                 & (0U < (IData)(vlSelfRef.tmpDig__DOT__tmpCount4)))) {
                vlSelfRef.tmpDig__DOT__tmpCountRst = 1U;
            }
        } else {
            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 0U;
        }
    } else if ((4U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
        if ((2U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
                vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                vlSelfRef.PA = 0U;
                vlSelfRef.PB = 0U;
                vlSelfRef.PC = 0U;
                vlSelfRef.PD = 0U;
                vlSelfRef.__Vdly__PI1 = (2U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank));
                vlSelfRef.__Vdly__tmpDig__DOT__childState 
                    = vlSelfRef.tmpDig__DOT__afterBlank;
                if ((6U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
                    vlSelfRef.__Vdly__tmpDig__DOT__parentState = 2U;
                    vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
                }
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
                vlSelfRef.PA = 0U;
                vlSelfRef.PB = 0U;
                vlSelfRef.PC = 0U;
                vlSelfRef.PD = 0U;
                vlSelfRef.__Vdly__PII1 = (1U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank));
                vlSelfRef.__Vdly__tmpDig__DOT__childState 
                    = vlSelfRef.tmpDig__DOT__afterBlank;
                if ((7U == (IData)(vlSelfRef.tmpDig__DOT__afterBlank))) {
                    vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
                }
            }
        } else {
            vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
        }
    } else if ((2U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
        if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
            vlSelfRef.__Vdly__tmpDig__DOT__childState = 0U;
            vlSelfRef.__Vdly__tmpDig__DOT__parentState = 1U;
        } else if (vlSelfRef.PI1) {
            vlSelfRef.__Vdly__tmpDig__DOT__count = 
                (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
            vlSelfRef.PI2 = 1U;
            vlSelfRef.s_BG2CMP = 1U;
            if ((0xeU < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                vlSelfRef.__Vdly__tmpDig__DOT__parentState = 5U;
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 2U;
                vlSelfRef.__Vdly__tmpDig__DOT__intermCmp 
                    = vlSelfRef.cmp;
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 2U;
            }
        } else {
            vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 2U;
            vlSelfRef.__Vdly__tmpDig__DOT__childState = 7U;
        }
    } else if ((1U & (IData)(vlSelfRef.tmpDig__DOT__childState))) {
        if (vlSelfRef.PII1) {
            vlSelfRef.__Vdly__tmpDig__DOT__count = 
                (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
            vlSelfRef.PII2 = 1U;
            if ((5U < (IData)(vlSelfRef.tmpDig__DOT__count))) {
                vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 7U;
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 6U;
                vlSelfRef.PII2 = 0U;
            } else {
                vlSelfRef.__Vdly__tmpDig__DOT__childState = 1U;
            }
        } else {
            vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 1U;
            vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
            vlSelfRef.__Vdly__tmpDig__DOT__childState = 6U;
        }
    } else {
        vlSelfRef.__Vdly__PI1 = 0U;
        vlSelfRef.PI2 = 0U;
        vlSelfRef.__Vdly__PII1 = 0U;
        vlSelfRef.PII2 = 0U;
        vlSelfRef.PA = 0U;
        vlSelfRef.PB = 1U;
        vlSelfRef.PC = 1U;
        vlSelfRef.PD = 1U;
        vlSelfRef.s_BgCtrl = 1U;
        vlSelfRef.s_BG2CMP = 0U;
        vlSelfRef.s_Cap2CMP = 0U;
        vlSelfRef.s_Ref2CMP = 0U;
        vlSelfRef.s_CapRst = 1U;
        vlSelfRef.s_PtatOut = 0U;
        vlSelfRef.s_Rdiscon_N = 1U;
        vlSelfRef.src_n = 0U;
        vlSelfRef.snk = 0U;
        vlSelfRef.PwrUp = 1U;
        vlSelfRef.__Vdly__tmpDig__DOT__stateCount = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__Hcharged = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__Lcharged = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__intermCmp = 0U;
        vlSelfRef.tmpDig__DOT__enable_cmp_toggle = 0U;
        vlSelfRef.__Vdly__tmpDig__DOT__lastPTATcmp = 0U;
        vlSelfRef.tmpDig__DOT__tmpCountRst = 0U;
        vlSelfRef.s_PtatCtrl = 1U;
        vlSelfRef.preChrg = 1U;
        vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
        if ((0xeU < (IData)(vlSelfRef.tmpDig__DOT__count))) {
            vlSelfRef.__Vdly__tmpDig__DOT__afterBlank = 1U;
            vlSelfRef.__Vdly__tmpDig__DOT__cmp_p1_fsm 
                = (1U & (~ (IData)(vlSelfRef.tmpDig__DOT__cmp_p1_fsm)));
            vlSelfRef.__Vdly__tmpDig__DOT__childState = 6U;
            vlSelfRef.__Vdly__PII1 = 1U;
            vlSelfRef.__Vdly__tmpDig__DOT__count = 0U;
            vlSelfRef.preChrg = 0U;
            vlSelfRef.s_PtatCtrl = 0U;
            vlSelfRef.preChrg = 0U;
        } else {
            vlSelfRef.__Vdly__tmpDig__DOT__count = 
                (0x3ffU & ((IData)(1U) + (IData)(vlSelfRef.tmpDig__DOT__count)));
            vlSelfRef.preChrg = 1U;
        }
    }
    vlSelfRef.PI1 = vlSelfRef.__Vdly__PI1;
    vlSelfRef.PII1 = vlSelfRef.__Vdly__PII1;
    vlSelfRef.tmpDig__DOT__count = vlSelfRef.__Vdly__tmpDig__DOT__count;
    vlSelfRef.tmpDig__DOT__stateCount = vlSelfRef.__Vdly__tmpDig__DOT__stateCount;
    vlSelfRef.tmpDig__DOT__Hcharged = vlSelfRef.__Vdly__tmpDig__DOT__Hcharged;
    vlSelfRef.tmpDig__DOT__Lcharged = vlSelfRef.__Vdly__tmpDig__DOT__Lcharged;
    vlSelfRef.tmpDig__DOT__intermCmp = vlSelfRef.__Vdly__tmpDig__DOT__intermCmp;
    vlSelfRef.tmpDig__DOT__childState = vlSelfRef.__Vdly__tmpDig__DOT__childState;
    vlSelfRef.tmpDig__DOT__parentState = vlSelfRef.__Vdly__tmpDig__DOT__parentState;
    vlSelfRef.tmpDig__DOT__afterBlank = vlSelfRef.__Vdly__tmpDig__DOT__afterBlank;
    vlSelfRef.tmpDig__DOT__lastPTATcmp = vlSelfRef.__Vdly__tmpDig__DOT__lastPTATcmp;
    vlSelfRef.tmpDig__DOT__cmp_p1_fsm = vlSelfRef.__Vdly__tmpDig__DOT__cmp_p1_fsm;
    vlSelfRef.tmpCountRst_out = vlSelfRef.tmpDig__DOT__tmpCountRst;
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__5(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__5\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tmpDig__DOT__tmpCount1 = vlSelfRef.__Vdly__tmpDig__DOT__tmpCount1;
    vlSelfRef.tmpDig__DOT__tmpCount2 = vlSelfRef.__Vdly__tmpDig__DOT__tmpCount2;
    vlSelfRef.tmpDig__DOT__tmpCount3 = vlSelfRef.__Vdly__tmpDig__DOT__tmpCount3;
    vlSelfRef.tmpDig__DOT__tmpCount4 = vlSelfRef.__Vdly__tmpDig__DOT__tmpCount4;
    vlSelfRef.tmpCount_out1 = vlSelfRef.tmpDig__DOT__tmpCount1;
    vlSelfRef.tmpCount_out2 = vlSelfRef.tmpDig__DOT__tmpCount2;
    vlSelfRef.tmpCount_out3 = vlSelfRef.tmpDig__DOT__tmpCount3;
    vlSelfRef.tmpCount_out4 = vlSelfRef.tmpDig__DOT__tmpCount4;
}

VL_INLINE_OPT void Vlng___024root___nba_sequent__TOP__6(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_sequent__TOP__6\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.tmpDig__DOT__rst = vlSelfRef.reset;
}

VL_INLINE_OPT void Vlng___024root___nba_comb__TOP__0(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___nba_comb__TOP__0\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.cmp_p1 = ((IData)(vlSelfRef.tmpDig__DOT__enable_cmp_toggle)
                         ? (IData)(vlSelfRef.tmpDig__DOT__cmp_p1_async)
                         : (IData)(vlSelfRef.tmpDig__DOT__cmp_p1_fsm));
    vlSelfRef.cmp_p2 = (1U & (~ (IData)(vlSelfRef.cmp_p1)));
}

void Vlng___024root___eval_triggers__act(Vlng___024root* vlSelf);

bool Vlng___024root___eval_phase__act(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_phase__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<4> __VpreTriggered;
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
    if (VL_UNLIKELY((vlSelfRef.tmpPulse & 0xfeU))) {
        Verilated::overWidthError("tmpPulse");}
}
#endif  // VL_DEBUG
