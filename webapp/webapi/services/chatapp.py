import openai


openai.api_key = "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"#"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"
MODEL = "gpt-3.5-turbo"

def getResponse(message:str):
    response = openai.ChatCompletion.create(
        model= MODEL,
        messages=[
                {"role": "system", "content": "You are a chatbot respond as if you are an expert"},
                {"role": "user", "content": message}, #"Why should DevOps engineer learn kubernetes?"
            ]
    )

    result = ''
    for choice in response.choices:
        result += choice.message.content

    print(result)

text = input('Input text: ')
getResponse(text)