import torch
import torchvision.models as models
import torchvision.transforms as transforms
from torch.autograd import Variable
from PIL import Image

print(torch.__version__)

# Load the pretrained model
model = models.resnet18(pretrained=True)
# Use the model object to select the desired layer
layer = model._modules.get('avgpool')
model.eval()
scaler = transforms.Resize((224, 224))
normalize = transforms.Normalize(mean=[0.485, 0.456, 0.406],
                                 std=[0.229, 0.224, 0.225])
to_tensor = transforms.ToTensor()

def copy_data(m, i, o):
        my_embedding.copy_(o.data)

with open('FeatureVecs3.txt', 'w') as f:
    for i in range(238809):
        print(i)
        fileName = 'segmentedImage3/' + str(i+1) + '.png'
        img = Image.open(fileName)
        t_img = Variable(normalize(to_tensor(scaler(img))).unsqueeze(0))
        my_embedding = torch.zeros(1, 512, 1, 1)
        h = layer.register_forward_hook(copy_data)
        model(t_img)
        h.remove();

        vecList = torch.squeeze(my_embedding).tolist();
        strList = [str(i) for i in vecList]

        f.write(', '.join(strList));
        f.write('\n');
