#include <stdio.h>
#include <stdlib.h>

struct node {
    int data;
    struct node *left, *right;
};

struct node* insert(struct node* root, int x) {
    if (root == NULL) {
        root = (struct node*)malloc(sizeof(struct node));
        root->data = x;
        root->left = root->right = NULL;
        return root;
    }
    if (x < root->data)
        root->left = insert(root->left, x);
    else
        root->right = insert(root->right, x);
    return root;
}

void inorder(struct node* root) {
    if (root != NULL) {
        inorder(root->left);
        printf("%d ", root->data);
        inorder(root->right);
    }
}

void preorder(struct node* root) {
    if (root != NULL) {
        printf("%d ", root->data);
        preorder(root->left);
        preorder(root->right);
    }
}

void postorder(struct node* root) {
    if (root != NULL) {
        postorder(root->left);
        postorder(root->right);
        printf("%d ", root->data);
    }
}

int main() {
    struct node* root = NULL;
    int arr[] = {6, 9, 5, 2, 8, 15, 24, 14, 7, 5, 2};
    int n = 11, i, ch;

    do {
        printf("\n1.Create BST\n2.Inorder\n3.Preorder\n4.Postorder\n5.Exit\n");
        printf("Enter choice: ");
        scanf("%d", &ch);

        switch(ch) {
            case 1:
                root = NULL;
                for (i = 0; i < n; i++)
                    root = insert(root, arr[i]);
                printf("BST Created\n");
                break;

            case 2:
                printf("Inorder Traversal: ");
                inorder(root);
                printf("\n");
                break;

            case 3:
                printf("Preorder Traversal: ");
                preorder(root);
                printf("\n");
                break;

            case 4:
                printf("Postorder Traversal: ");
                postorder(root);
                printf("\n");
                break;
        }
    } while (ch != 5);

    return 0;
}
