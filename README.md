# Div_5
 Create a block that check if a number is divisible by “5” ?  Every cycle, LSB receives a new bit; if the current sequence is divisible by “5”, block transmits “1”.


### RTL Description: Div_5 Module with Remainder Calculation

- **Module Name**: Div_5
- **Inputs**:
  - `clk`: Clock input.
  - `rst`: Reset input.
  - `d_in`: Input data.
- **Outputs**:
  - `remainder`: Output representing the remainder of the division by 5.
  - `d_out`: Output indicating whether the current state results in output being high.
- **Parameters**:
  - `IDLE`: State representing the idle state.
  - `REM1`, `REM2`, `REM3`, `REM4`, `REM0`: States representing the remainder values.
- **Description**:
  - The `Div_5` module calculates the remainder of dividing the input `d_in` by 5.
  - It utilizes a finite state machine (FSM) with six states: IDLE, REM1, REM2, REM3, REM4, and REM0.
  - Initially, the FSM is in the IDLE state.
  - Upon each clock cycle, the FSM transitions to the next state based on the current state and the value of `d_in`.
  - The output `remainder` indicates the current remainder value based on the state.
  - The output `d_out` is high when the FSM reaches the REM0 state.
- **Behavior**:
  - **IDLE State**: 
    - If `d_in` is zero, remains in IDLE state.
    - Otherwise, transitions to REM1 state.
  - **REM1 State**: 
    - If `d_in` is zero, transitions to REM2 state.
    - Otherwise, transitions to REM3 state.
  - **REM2 State**: 
    - If `d_in` is zero, transitions to REM4 state.
    - Otherwise, transitions to REM0 state.
  - **REM3 State**: 
    - If `d_in` is zero, transitions to REM1 state.
    - Otherwise, transitions to REM2 state.
  - **REM4 State**: 
    - If `d_in` is zero, remains in REM3 state.
    - Otherwise, remains in REM4 state.
  - **REM0 State**: 
    - If `d_in` is zero, remains in REM0 state.
    - Otherwise, transitions to REM1 state.
- **Additional Comments**:
  - This module effectively calculates the remainder of dividing the input `d_in` by 5 and generates an output `d_out` when the remainder is zero.
