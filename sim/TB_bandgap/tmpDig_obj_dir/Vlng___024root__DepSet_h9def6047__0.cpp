// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vlng.h for the primary calling header

#include "Vlng__pch.h"
#include "Vlng__Syms.h"
#include "Vlng___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vlng___024root___dump_triggers__act(Vlng___024root* vlSelf);
#endif  // VL_DEBUG

void Vlng___024root___eval_triggers__act(Vlng___024root* vlSelf) {
    (void)vlSelf;  // Prevent unused variable warning
    Vlng__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vlng___024root___eval_triggers__act\n"); );
    auto &vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.set(0U, (((IData)(vlSelfRef.clk) 
                                        & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0))) 
                                       | ((IData)(vlSelfRef.reset) 
                                          & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__reset__0)))));
    vlSelfRef.__VactTriggered.set(1U, ((IData)(vlSelfRef.clk) 
                                       & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__clk__0))));
    vlSelfRef.__VactTriggered.set(2U, ((((IData)(vlSelfRef.cmp) 
                                         & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__cmp__0))) 
                                        | ((IData)(vlSelfRef.reset) 
                                           & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__reset__0)))) 
                                       | ((IData)(vlSelfRef.tmpDig__DOT__tmpCountRst) 
                                          & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__tmpDig__DOT__tmpCountRst__0)))));
    vlSelfRef.__Vtrigprevexpr___TOP__clk__0 = vlSelfRef.clk;
    vlSelfRef.__Vtrigprevexpr___TOP__reset__0 = vlSelfRef.reset;
    vlSelfRef.__Vtrigprevexpr___TOP__cmp__0 = vlSelfRef.cmp;
    vlSelfRef.__Vtrigprevexpr___TOP__tmpDig__DOT__tmpCountRst__0 
        = vlSelfRef.tmpDig__DOT__tmpCountRst;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vlng___024root___dump_triggers__act(vlSelf);
    }
#endif
}
