import os
import pickle
import matplotlib.pyplot as plt
from matplotlib.legend_handler import HandlerLine2D
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.linear_model import LogisticRegression
from sklearn import metrics
from sklearn.metrics import accuracy_score

def df_target_split(df, target, s = 2, ts = .3):
    """
    Splits a pandas dataframe againste a target vector 
    """
    # Separate target from data.
    ex_y = np.array(df[f'{target}'])
    # Split the predictors from data.
    ex_x = df.drop(f'{target}', axis = 1)

    # Set the seed.
    np.random.seed(s)
    
    # Split data into training and test set
    ex_X_train, ex_X_test, ex_y_train, ex_y_test = train_test_split(ex_x, ex_y, test_size = ts)
    
    return ex_X_train, ex_X_test, ex_y_train, ex_y_test

def plt_cm(y_test, y_predict):
    """
    Splits a pandas dataframe againste a target vector 
    """

    #Take a look at test data confusion matrix and get accuracy
    conf_matrix = metrics.confusion_matrix(y_test, y_predict)
    accuracy = metrics.accuracy_score(y_test, y_predict)
    
    # make pretty and plot
    plt.clf()
    plt.imshow(conf_matrix, 
               interpolation='nearest', 
               cmap=plt.cm.Wistia)
    classNames = ['Negative','Positive']
    plt.title('Confusion Matrix - Test Data')
    plt.ylabel('True label')
    plt.xlabel('Predicted label')
    tick_marks = np.arange(len(classNames))
    plt.xticks(tick_marks, classNames, rotation=45)
    plt.yticks(tick_marks, classNames)
    s = [['TN','FP'], ['FN', 'TP']]
    for i in range(2):
        for j in range(2):
            plt.text(j,i, str(s[i][j]) + " = " + str(conf_matrix[i][j]))
    plt.show()
    # print accuracy
    print("Accuracy for the model on test data: ", accuracy)
    return accuracy

def accuracy_ROKs(y_test,y_pred, model_name = ''):


    class_report = metrics.classification_report(y_test,
                                                 y_pred)
    print(class_report)
    
    # Calculate metrics for ROC (fpr, tpr) and calculate AUC.
    fpr, tpr, threshold = metrics.roc_curve(y_test, y_pred)
    roc_auc = metrics.auc(fpr, tpr)

    # Plot ROC.
    plt.title('Receiver Operating Characteristic')
    plt.plot(fpr, 
             tpr, 
             'b', 
             label = f'{model_name}_AUC = %0.2f' % roc_auc)
    plt.legend(loc = 'lower right')
    plt.plot([0, 1], [0, 1],'r--')
    plt.xlim([0, 1])
    plt.ylim([0, 1])
    plt.ylabel('True Positive Rate')
    plt.xlabel('False Positive Rate')
    plt.show()

def update_model_score(model_df, model_accuracy, m_name):
    model_df = model_df.append(
    {'metrics' : "accuracy" ,
     'values' : round(model_accuracy,4),
     'model': m_name
    },
    ignore_index = True
    )
    
    print(model_df)
    return model_df

# plot the results of train and test
def plot_results(optimizer, train_results, test_results, o_param):
    line1, = plt.plot(optimizer,
                      train_results, 
                      'b', 
                      label = "Train accuracy")
    line2, = plt.plot(optimizer, 
                      test_results, 
                      'r', 
                      label = "Test accuracy")
    plt.legend(handler_map={line1: HandlerLine2D(numpoints = 2)})
    plt.ylabel('Accuracy')
    plt.xlabel(o_param)
    plt.show()

# Define function that will determine the optimal number for each parameter. curtesy of Data Society
def optimal_parameter(values,test_results):
    best_test_value = max(test_results)
    best_test_index = test_results.index(best_test_value)
    ex_best_value = values[best_test_index]
    return(ex_best_value)

# define function to optimize model
def model_optimizer(df, target, model, optimizer, o_param, seed = 1):
    # intiate empty lists
    train_results = []
    test_results = []
    
    # call function to split train and test data, specify income
    X_train, X_test, Y_train, Y_test = df_target_split(df, target, seed)
    
    for i in optimizer:
        
        # pass o_param as dictionary key and i as value
        params = { o_param : i}
        
        # pass and unpack params dictionary as specified parameter
        model = model.set_params(**params)
        
        # fit data
        model.fit(X_train, Y_train)
        train_pred = model.predict(X_train)
        acc_train = accuracy_score(Y_train, train_pred)

        # Add AUC score to previous train results
        train_results.append(acc_train)
        y_pred = model.predict(X_test)
        acc_test = accuracy_score(Y_test, y_pred)

        # Add AUC score to previous test results
        test_results.append(acc_test)

    #plot the results
    plot_results(optimizer, train_results, test_results, o_param)

    # return optimal parameter.
    return optimal_parameter(optimizer, test_results)

#sdsgfaf
def logistic_model(x,y):
    np.random.seed(22)
    X_train, X_test, y_train, y_test = train_test_split(x, y, test_size = 0.30)
    logreg = LogisticRegression()
    logreg.fit(X_train, y_train)
    y_pred = logreg.predict(X_test)
    accuracy = metrics.accuracy_score(y_test, y_pred)
    return(accuracy)

def quick_model(df, target, model, seed = 1):
    
    # call function to split train and test data, specify income
    x_train, x_test, y_train, y_test = df_target_split(df, target, seed)
    
    # fit data
    model.fit(x_train, y_train)
    y_pred = model.predict(x_test)
    accuracy = metrics.accuracy_score(y_test, y_pred)
    
    #plot the results
    accuracy = plt_cm(y_test, y_pred)

    return(accuracy, model)

def fillna_median(dataset):
    col_list = dataset.columns.tolist()
    for i in range(0, dataset.shape[1]):
        dataset.iloc[:,i].fillna(dataset.iloc[:,i].median(), inplace = True)