import sys
from colorama import init, Fore, Style

init()

def print_failure():
    print(f"{Fore.RED}Password not Found :({Style.RESET_ALL}")

def print_success(password):
    print(f"{Fore.BLUE}Password Found: {password}{Style.RESET_ALL}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        if sys.argv[1] == "failure":
            print_failure()
        elif sys.argv[1] == "success" and len(sys.argv) > 2:
            print_success(sys.argv[2])