/* SYSTEM IMPORTS*/
#include "low_level/type_definitions.h"

/* HAL IMPORTS*/
#include "system/init.h"
#include "stm32wlxx_hal_gpio.h"
#include "stm32wlxx_hal_subghz.h"
#include "stm32wlxx_hal_tim.h"
#include "stm32wlxx_hal_uart.h"

/* DRIVER IMPORTS*/
// #include "drivers/bbpwm/bbpwm.h"

// uart initialization
UART_HandleTypeDef huart2;

int main(void) {
  /* ==================== Initialization Code ==================== */
  init(); // This should be the first line of code in the initialization code.

  printf("Starting up...");
  // Initialize timer
  // HAL_TIM_Base_Start(&htim1);


  /* ==================== Infinite While Loop ==================== */
  while (1) {
    // uint16_t count = htim1.Instance->CNT;
    // printf("%d\r\n", count);

    // Turn LED on
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_SET);
    HAL_Delay(100);
    
    // Turn LED off
    HAL_GPIO_WritePin(GPIOB, GPIO_PIN_12, GPIO_PIN_RESET);
    HAL_Delay(100);    
  }
  return 0;
}

int _write(int file, char *ptr, int len) {
  // This just defines what "p"
  HAL_UART_Transmit(&huart2, (uint8_t *)ptr, len, HAL_MAX_DELAY);
  return len;
}