
bench:
	@./tests/benchmark/run 1 tests/benchmark/middleware
	@./tests/benchmark/run 50 tests/benchmark/middleware
	@./tests/benchmark/run 100 tests/benchmark/middleware
	@./tests/benchmark/run 150 tests/benchmark/middleware
	@./tests/benchmark/run 200 tests/benchmark/middleware
	@./tests/benchmark/run 300 tests/benchmark/middleware
	@./tests/benchmark/run 500 tests/benchmark/middleware
	@./tests/benchmark/run 1000 tests/benchmark/middleware
	@echo

.PHONY: bench
