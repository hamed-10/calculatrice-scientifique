# =============================================================================
#  Makefile — Calculatrice Scientifique en C
#  Usage : make        → compile le projet complet
#          make test   → compile et exécute les tests
#          make clean  → supprime les fichiers générés
# =============================================================================

CC      = gcc
CFLAGS  = -Wall -Wextra -std=c99 -Wno-unused-parameter

MODULES = core basic memory functions calculus complex stat basen eqn matrix constants interface

SRC     = $(foreach m,$(MODULES),$(wildcard src/$(m)/*.c))
OBJS    = $(SRC:.c=.o)
TARGET  = calc

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ -lm
	@echo "==> Build OK : ./$(TARGET)"

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

test:
	@echo "==> Compilation des tests..."
	@for mod in $(MODULES); do \
	    echo "  test $$mod..."; \
	    $(CC) $(CFLAGS) tests/$$mod/test_$$mod.c $(SRC) -o tests/$$mod/runner_$$mod -lm 2>&1 && \
	    ./tests/$$mod/runner_$$mod || exit 1; \
	done
	@echo "==> Tous les tests passent."

clean:
	rm -f $(OBJS) $(TARGET)
	find tests -name "runner_*" -delete
	@echo "==> Clean OK"

.PHONY: all test clean
