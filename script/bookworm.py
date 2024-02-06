# Install required modules
import requests
import pyscript

# Define functions
def fetch_data_from_php(url):
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        print('Error fetching data from example.php.')
        return None

def update_question_and_answers(data, cnt):
    if len(data) > cnt:
        question_label.text = data[cnt]['question']
        answer[0] = data[cnt]['answer1']
        answer[1] = data[cnt]['answer2']
        shuffle_array(answer)
        btn1.text = answer[0]
        btn2.text = answer[1]
        global correct_answer
        correct_answer = data[cnt]['answer']
    else:
        print('No more questions available.')

def shuffle_array(array):
    for i in range(len(array) - 1, 0, -1):
        j = random.randint(0, i)
        array[i], array[j] = array[j], array[i]

def compare_if_correct(answer):
    if answer == correct_answer:
        print(True)
    else:
        print(False)

# Specify the URL for 'example.php'
example_php_url = '../html/example.php'  # Replace with the actual URL

# Fetch data from 'example.php'
data = fetch_data_from_php(example_php_url)

if data:
    # Initialize variables
    answer = [None, None]
    correct_answer = None
    cnt = 0

    # Execute functions
    update_question_and_answers(data, cnt)

    # Define button click events
    def btn1_click():
        compare_if_correct(btn1.text)
        global cnt
        cnt += 1
        update_question_and_answers(data, cnt)

    def btn2_click():
        compare_if_correct(btn2.text)
        global cnt
        cnt += 1
        update_question_and_answers(data, cnt)

    # Simulate button clicks
    btn1_click()
    btn2_click()
