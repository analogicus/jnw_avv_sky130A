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
    , PI1{vlSymsp->TOP.PI1}
    , PI2{vlSymsp->TOP.PI2}
    , PII1{vlSymsp->TOP.PII1}
    , dummy{vlSymsp->TOP.dummy}
    , PII2{vlSymsp->TOP.PII2}
    , PA{vlSymsp->TOP.PA}
    , PB{vlSymsp->TOP.PB}
    , PC{vlSymsp->TOP.PC}
    , PD{vlSymsp->TOP.PD}
    , src_n{vlSymsp->TOP.src_n}
    , snk{vlSymsp->TOP.snk}
    , cmp_p1{vlSymsp->TOP.cmp_p1}
    , cmp_p2{vlSymsp->TOP.cmp_p2}
    , rst{vlSymsp->TOP.rst}
    , valid{vlSymsp->TOP.valid}
    , preChrg{vlSymsp->TOP.preChrg}
    , setupBias{vlSymsp->TOP.setupBias}
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
