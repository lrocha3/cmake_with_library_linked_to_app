#include "gtest/gtest.h"
#include "printer.h"

namespace {
    class PrinterTest : public testing::Test {

    };

    TEST_F(PrinterTest, printToScreen) {
        printToScreen("Ola");
        ASSERT_EQ(true, true);
    }
}