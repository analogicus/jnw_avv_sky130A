// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vlng__pch.h"

//============================================================
// Constructors

Vlng::Vlng(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vlng__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , reset{vlSymsp->TOP.reset}
    , cmp{vlSymsp->TOP.cmp}
    , tmpPulse{vlSymsp->TOP.tmpPulse}
    , PI1{vlSymsp->TOP.PI1}
    , PI2{vlSymsp->TOP.PI2}
    , dummy{vlSymsp->TOP.dummy}
    , PII1{vlSymsp->TOP.PII1}
    , PII2{vlSymsp->TOP.PII2}
    , PA{vlSymsp->TOP.PA}
    , PB{vlSymsp->TOP.PB}
    , PC{vlSymsp->TOP.PC}
    , PD{vlSymsp->TOP.PD}
    , s_BG2CMP{vlSymsp->TOP.s_BG2CMP}
    , s_BgCtrl{vlSymsp->TOP.s_BgCtrl}
    , s_PtatCtrl{vlSymsp->TOP.s_PtatCtrl}
    , s_Cap2CMP{vlSymsp->TOP.s_Cap2CMP}
    , s_Ref2CMP{vlSymsp->TOP.s_Ref2CMP}
    , s_CapRst{vlSymsp->TOP.s_CapRst}
    , s_PtatOut{vlSymsp->TOP.s_PtatOut}
    , s_Rdiscon_N{vlSymsp->TOP.s_Rdiscon_N}
    , s_CCOcap1{vlSymsp->TOP.s_CCOcap1}
    , s_CCOcap2{vlSymsp->TOP.s_CCOcap2}
    , src_n{vlSymsp->TOP.src_n}
    , snk{vlSymsp->TOP.snk}
    , cmp_p1{vlSymsp->TOP.cmp_p1}
    , cmp_p2{vlSymsp->TOP.cmp_p2}
    , PwrUp{vlSymsp->TOP.PwrUp}
    , valid{vlSymsp->TOP.valid}
    , preChrg{vlSymsp->TOP.preChrg}
    , setupBias{vlSymsp->TOP.setupBias}
    , tmpCount_out1{vlSymsp->TOP.tmpCount_out1}
    , tmpCount_out2{vlSymsp->TOP.tmpCount_out2}
    , tmpCountRst_out{vlSymsp->TOP.tmpCountRst_out}
    , count_out{vlSymsp->TOP.count_out}
    , tmpSampleCount_out{vlSymsp->TOP.tmpSampleCount_out}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vlng::Vlng(const char* _vcname__)
    : Vlng(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vlng::~Vlng() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vlng___024root___eval_debug_assertions(Vlng___024root* vlSelf);
#endif  // VL_DEBUG
void Vlng___024root___eval_static(Vlng___024root* vlSelf);
void Vlng___024root___eval_initial(Vlng___024root* vlSelf);
void Vlng___024root___eval_settle(Vlng___024root* vlSelf);
void Vlng___024root___eval(Vlng___024root* vlSelf);

void Vlng::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vlng::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vlng___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vlng___024root___eval_static(&(vlSymsp->TOP));
        Vlng___024root___eval_initial(&(vlSymsp->TOP));
        Vlng___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vlng___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vlng::eventsPending() { return false; }

uint64_t Vlng::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vlng::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vlng___024root___eval_final(Vlng___024root* vlSelf);

VL_ATTR_COLD void Vlng::final() {
    Vlng___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vlng::hierName() const { return vlSymsp->name(); }
const char* Vlng::modelName() const { return "Vlng"; }
unsigned Vlng::threads() const { return 1; }
void Vlng::prepareClone() const { contextp()->prepareClone(); }
void Vlng::atClone() const {
    contextp()->threadPoolpOnClone();
}
