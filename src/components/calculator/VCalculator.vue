<template>
  <div class="v-calculator">
    <div class="v-calculator__top">
      <VCalcField
          :mathString="mathString"
          :history="history"
      />
    </div>
    <div class="v-calculator__bottom">
      <div class="v-calculator__num-block">
        <VCalcNumButton
            v-for="(number, key) in config.numButtons"
            :number="number"
            :key="key"
            :disabled="numDisabled"
            @onClick="addSymbolToString"
        />
      </div>
      <div class="v-calculator__math-block">
        <VCalcMathButton
            v-for="(button, key) in config.mathButtons"
            :button="button"
            :key="key"
            :disabled="mathDisabled"
            @onClick="addSymbolToString"
        />
      </div>
    </div>
  </div>
</template>

<script>
import VCalcField from "@/components/calculator/components/VCalcField";
import VCalcMathButton from "@/components/calculator/components/VCalcMathButton";
import VCalcNumButton from "@/components/calculator/components/VCalcNumButton";

export default {
  name: "VCalculator",
  components: {
    VCalcField,
    VCalcMathButton,
    VCalcNumButton,
  },
  data() {
    return {
      config: {
        maxLength: null,
        historyLength: 2,
        numButtons: [7, 8, 9, 4, 5, 6, 1, 2, 3, 0, '.'],
        mathButtons: ['+', '-', '*', '/', 'sqrt', '**', '=', 'C'],
      },
      mathString: '',
      showResult: false,
      numbers: [],
      actions: [],
      mathActions: {
        sqrt: 'sqrt',
        clear: 'C',
        result: '='
      },
      result: null,
      history: [],
    };
  },
  computed: {
    numDisabled() {
      // eslint-disable-next-line no-unused-vars
      const rules = {
        maxLength: () => this.config.maxLength ? this.mathString?.length >= this.config.maxLength : false,
        ifLastSymbolNotMath: () => this.mathString?.length ? this._last(this.mathString) === ')' : false
      }
      return rules.maxLength() || rules.ifLastSymbolNotMath();
    },
    mathDisabled() {
      return this.mathString?.length <= 0;
    },
  },
  methods: {
    addSymbolToString(symbol) {
      const str = this.mathString?.toString();
      const lastSymbol = this._last(str);
      const isLastSymbolAtNumber = str.length && isFinite(lastSymbol);
      this.showResult = false;

      switch (symbol.toString()) {
        case this.mathActions.result:
          return this.showResult = true;

        case this.mathActions.clear:
          return this.clear();

        case this.mathActions.sqrt:
          return this.stringToSqrt();

        default:
          if ((isLastSymbolAtNumber || isFinite(symbol)) || lastSymbol === ')') {
            this.mathString += symbol.toString();
          } else {
            this.mathString = this._setLast(this.mathString, symbol)
          }
      }
    },
    getResult() {
      if (!isFinite(this._last(this.mathString)) && this._last(this.mathString) !== ')') {
        this.mathString = this.mathString.slice(0, -1)
      }

      const result = Function("return " + this.mathString.replaceAll('sqrt', 'Math.sqrt'));

      return result()

    },
    setResults() {
      this.result = this.getResult();

      const historyItem = {
        id: Date.now(),
        string: this.mathString,
        result: this.result,
      }

      this.history.push(historyItem)
      if (this.history.length >= this.config.historyLength) {
        this.history.shift()
      }
      this.mathString = this.result === 0 ? '' : this.result.toString();
    },
    stringToSqrt() {
      if (this._last(this.mathString) === ')') {
        return;
      }
      const str = []

      for (let index = this._lastIndex(this.mathString); index >= 0; index--) {
        const symbol = this.mathString[index];
        if (isFinite(symbol)) {
          str.push(symbol)
        } else {
          break;
        }
      }

      const reverseStr = str.join('');
      const reverseMathStr = this._reverse(this.mathString);
      const reverseReplaceValue = this._reverse(`sqrt(${reverseStr})`);

      const resultStr = this._reverse(
          reverseMathStr.replace(
              reverseStr,
              reverseReplaceValue
          ));

      this.mathString = resultStr;
      return resultStr;
    },
    clear() {
      this.mathString = '';
    },
    _last(item) {
      return item[item?.length - 1];
    },
    _lastIndex(item) {
      return item?.length - 1;
    },
    _reverse(string) {
      return string?.split('').reverse().join('');
    },
    _setLast(string, symbol) {
      return string.slice(0, -1) + symbol;
    },
  },
  watch: {
    showResult(e) {
      if (e) {
        this.setResults()
      }
    },
  },
}
</script>

<style>
* {
  font-weight: bold;
  font-family: monospace;
}

.v-calculator {
  min-height: 500px;
  max-width: 400px;
  width: 100%;
  margin: auto;
  box-shadow: 0 0 8px 0 #696767;
  border-radius: 40px;
  padding: 15px;
  background: #383838;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  gap: 15px;
}

.v-calculator__top {
  display: flex;
  flex: 1 1 100%;
  height: 100%;
  width: 100%;
  background: #ddd;
  border-radius: 30px;
}

.v-calculator__bottom {
  display: flex;
  flex-wrap: nowrap;
}

.v-calculator__num-block {
  display: flex;
  flex-wrap: wrap;
  flex: 1 1 60%;
}

.v-calculator__math-block {
  flex: 1 1 40%;
  display: flex;
  flex-wrap: wrap;
}
</style>
