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
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        VL_IN8(clk,0,0);
        VL_IN8(reset,0,0);
        VL_IN8(cmp,0,0);
        CData/*0:0*/ tmpDig__DOT__tmpCountRst;
        VL_IN8(tmpPulse,0,0);
        VL_OUT8(PI1,0,0);
        VL_OUT8(PI2,0,0);
        VL_OUT8(dummy,0,0);
        VL_OUT8(PII1,0,0);
        VL_OUT8(PII2,0,0);
        VL_OUT8(PA,0,0);
        VL_OUT8(PB,0,0);
        VL_OUT8(PC,0,0);
        VL_OUT8(PD,0,0);
        VL_OUT8(s_BG2CMP,0,0);
        VL_OUT8(s_BgCtrl,0,0);
        VL_OUT8(s_PtatCtrl,0,0);
        VL_OUT8(s_Cap2CMP,0,0);
        VL_OUT8(s_Ref2CMP,0,0);
        VL_OUT8(s_CapRst,0,0);
        VL_OUT8(s_PtatOut,0,0);
        VL_OUT8(s_Rdiscon_N,0,0);
        VL_OUT8(s_CmpOutDisable,0,0);
        VL_OUT8(src_n,0,0);
        VL_OUT8(snk,0,0);
        VL_OUT8(cmp_p1,0,0);
        VL_OUT8(cmp_p2,0,0);
        VL_OUT8(PwrUp,0,0);
        VL_OUT8(valid,0,0);
        VL_OUT8(preChrg,0,0);
        VL_OUT8(setupBias,0,0);
        VL_OUT8(tmpCount_out1,7,0);
        VL_OUT8(tmpCount_out2,7,0);
        VL_OUT8(tmpCount_out3,7,0);
        VL_OUT8(tmpCount_out4,7,0);
        VL_OUT8(tmpCountRst_out,0,0);
        CData/*2:0*/ tmpDig__DOT__afterBlank;
        CData/*2:0*/ tmpDig__DOT__childState;
        CData/*2:0*/ tmpDig__DOT__parentState;
        CData/*5:0*/ tmpDig__DOT__stateCount;
        CData/*7:0*/ tmpDig__DOT__tmpCount1;
        CData/*7:0*/ tmpDig__DOT__tmpCount2;
        CData/*7:0*/ tmpDig__DOT__tmpCount3;
        CData/*7:0*/ tmpDig__DOT__tmpCount4;
        CData/*0:0*/ tmpDig__DOT__Hcharged;
        CData/*0:0*/ tmpDig__DOT__Lcharged;
        CData/*0:0*/ tmpDig__DOT__intermCmp;
        CData/*0:0*/ tmpDig__DOT__enable_cmp_toggle;
        CData/*0:0*/ tmpDig__DOT__cmp_p1_fsm;
        CData/*0:0*/ tmpDig__DOT__cmp_p1_async;
        CData/*0:0*/ tmpDig__DOT__CmpOutDisable_reg;
        CData/*1:0*/ tmpDig__DOT__CmpOutDisableCount;
        CData/*0:0*/ tmpDig__DOT__lastPTATcmp;
        CData/*0:0*/ tmpDig__DOT__rst;
        CData/*0:0*/ __Vdly__PI1;
        CData/*0:0*/ __Vdly__PII1;
        CData/*5:0*/ __Vdly__tmpDig__DOT__stateCount;
        CData/*0:0*/ __Vdly__tmpDig__DOT__Hcharged;
        CData/*0:0*/ __Vdly__tmpDig__DOT__Lcharged;
        CData/*0:0*/ __Vdly__tmpDig__DOT__intermCmp;
        CData/*0:0*/ __Vdly__tmpDig__DOT__lastPTATcmp;
        CData/*2:0*/ __Vdly__tmpDig__DOT__parentState;
        CData/*2:0*/ __Vdly__tmpDig__DOT__childState;
        CData/*2:0*/ __Vdly__tmpDig__DOT__afterBlank;
    };
    struct {
        CData/*0:0*/ __Vdly__tmpDig__DOT__cmp_p1_fsm;
        CData/*7:0*/ __Vdly__tmpDig__DOT__tmpCount4;
        CData/*7:0*/ __Vdly__tmpDig__DOT__tmpCount3;
        CData/*7:0*/ __Vdly__tmpDig__DOT__tmpCount2;
        CData/*7:0*/ __Vdly__tmpDig__DOT__tmpCount1;
        CData/*0:0*/ __VstlFirstIteration;
        CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__reset__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__cmp__0;
        CData/*0:0*/ __Vtrigprevexpr___TOP__tmpDig__DOT__tmpCountRst__0;
        CData/*0:0*/ __VactContinue;
        SData/*9:0*/ tmpDig__DOT__count;
        SData/*9:0*/ __Vdly__tmpDig__DOT__count;
        IData/*31:0*/ __VactIterCount;
    };
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<4> __VactTriggered;
    VlTriggerVec<4> __VnbaTriggered;

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
