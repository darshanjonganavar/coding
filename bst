#include <stdio.h>
#include <stdlib.h>

struct node {
    int data;
    struct node *left, *right;
};

struct node* insert(struct node* root, int x) {
    if(root == NULL) {
        root = malloc(sizeof(struct node));
        root->data = x;
        root->left = root->right = NULL;
    }
    else if(x < root->data)
        root->left = insert(root->left, x);
    else
        root->right = insert(root->right, x);
    return root;
}

void inorder(struct node* root) {
    if(root) {
        inorder(root->left);
        printf("%d ", root->data);
        inorder(root->right);
    }
}

int main() {
    int a[] = {6,9,5,2,8,15,24,14,7,5,2};
    struct node* root = NULL;
    for(int i=0;i<11;i++)
        root = insert(root,a[i]);

    printf("Inorder traversal:\n");
    inorder(root);
    return 0;
}
