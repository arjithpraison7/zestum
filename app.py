from flask import Flask, request, jsonify, render_template
from PIL import Image
import io
import torch
from transformers import CLIPProcessor, CLIPModel

app = Flask(__name__)

# Load the CLIP model and processor
model = CLIPModel.from_pretrained("openai/clip-vit-base-patch16")
processor = CLIPProcessor.from_pretrained("openai/clip-vit-base-patch16")

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Get the uploaded file
        file = request.files['video']
        
        # Debugging information
        print(f"File name: {file.filename}, Content type: {file.content_type}, Size: {file.content_length}")

        # Read the image from the incoming file
        image_bytes = file.read()
        img = Image.open(io.BytesIO(image_bytes))

        # Define some text labels you want to compare the image against
        text_labels = ["water", "tree", "flower","brown", "desert", "grass", "cave", "ash", "straw", "snow","nether","earthy"]

        # Preprocess the image and text
        inputs = processor(text=text_labels, images=img, return_tensors="pt", padding=True)

        # Make predictions using the CLIP model
        outputs = model(**inputs)

        # Extracting the logits per image and text
        logits_per_image = outputs.logits_per_image  # Shape: [1, text_label_count]
        probs = logits_per_image.softmax(dim=1)  # Softmax to get probabilities

        # Convert predictions to a readable format
        predictions = {text_labels[i]: float(probs[0][i]) for i in range(len(text_labels))}
        sorted_predictions = sorted(predictions.items(), key=lambda x: x[1], reverse=True)

        prediction_text = ', '.join([f"{label}: {score:.4f}" for label, score in sorted_predictions])

        return prediction_text
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(debug=True)
