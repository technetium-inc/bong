module main

fn create_digit_array(range int) []string {
	mut range_array := []string{}
	for index := 0; index < range; index++ {
		range_array << index.str()
	}
	return range_array
}

const (
	digits = create_digit_array(10)
)

fn remove_source_comments(source string) string {
	statements := source.split_into_lines().filter(fn (element string) bool {
		return !element.starts_with('#')
	})
	return statements.join('\n')
}

fn create_character_string(character byte) string {
	return byte(character).ascii_str()
}

struct Token {
	character string
	token_type string
}

struct BfProcess {
	mut:
	memory []int = [0]
	ptr int
	data string [required]
	last_input_character string
}

fn (mut process BfProcess) parse() []Token {
	mut tokens := []Token{}

	for character in process.data {
		if [`+`, `-`, `*`, `>`, `<`].contains(character) {
			tokens << Token{character:create_character_string(character), token_type:'op'}
		} else if create_character_string(character) in digits {
			tokens << Token{character:create_character_string(character)}
		} 
	}
	return tokens
}

fn (mut process BfProcess) execute() {
	tokens := process.parse()
	mut token_index := 0
	for {
		current_token := tokens[token_index]
		mut operation_value := 1
		if current_token.token_type == 'op' {
			if token_index == 0 {
			} else {
				previous_value := tokens[token_index-1]
				if previous_value.token_type == 'op'{
					// operation_value := 1
				} else {
					operation_value = previous_value.character.int()
				}
			}
			// println(process.memory[process.ptr])
		}
		if token_index == tokens.len-1 {
			break
		}

		token_index += 1
	}
}
