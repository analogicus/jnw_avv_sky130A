// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vlng.h for the primary calling header

#ifndef VERILATED_VLNG___024ROOT_H_
#define VERILATED_VLNG___024ROOT_H_  // guard

#include "verilated.h"


class Vlng__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vlng___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(reset,0,0);
    VL_IN8(cmp,0,0);
    VL_OUT8(PI1,0,0);
    VL_OUT8(PI2,0,0);
    VL_OUT8(PII1,0,0);
    VL_OUT8(PII2,0,0);
    VL_OUT8(PA,0,0);
    VL_OUT8(PB,0,0);
    VL_OUT8(PC,0,0);
    VL_OUT8(PD,0,0);
    VL_OUT8(src,0,0);
    VL_OUT8(snk,0,0);
    VL_OUT8(rst,0,0);
    VL_OUT8(valid,0,0);
    CData/*2:0*/ tmpDig__DOT__state;
    CData/*5:0*/ tmpDig__DOT__count;
    CData/*0:0*/ tmpDig__DOT__cmpEvent;
    CData/*0:0*/ tmpDig__DOT__outNxt;
    CData/*0:0*/ tmpDig__DOT__Hnxt;
    CData/*0:0*/ tmpDig__DOT__prevCmp;
    CData/*2:0*/ __Vdly__tmpDig__DOT__state;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__reset__0;
    CData/*0:0*/ __Vtrigprevexpr___TOP__cmp__0;
    CData/*0:0*/ __VactDidInit;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<3> __VactTriggered;
    VlTriggerVec<3> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vlng__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vlng___024root(Vlng__Syms* symsp, const char* v__name);
    ~Vlng___024root();
    VL_UNCOPYABLE(Vlng___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
