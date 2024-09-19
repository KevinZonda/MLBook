import torch.nn as nn

M = 28
N = 28


model = nn.Sequential(
            # Flatten matrix to vector
            nn.Flatten(),

            # MLP
            nn.Linear(M * N, 128),
            nn.ReLU(),
            nn.Linear(128, 32),
            nn.ReLU(),
            nn.Linear(32, 3),

            # Softmax
            nn.Softmax(dim=1)
        )