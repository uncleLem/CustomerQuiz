import math
from quiz.models import *

__author__ = 'unclelem'


def calculate(projects):
    debug = True
    predictors = []
    response = []
    groups = QuestionGroup.objects.filter(included=1, position_No__gt=0)

    for group in groups:
        predictor = []
        questions = Question.objects.filter(id_question_group=group)
        for project in projects:
            value = 0
            for question in questions:
                answers = Answer.objects.filter(project=project, question=question)
                if group.group_type.group_type != 'enum':
                    for answer in answers:
                        if answer.value == '1':
                            value += question.value
                else:
                    value += answers.__len__()
            predictor.append(value)
        predictors.append(predictor)

    for project in projects:
        response.append(project.real_result)

    N = groups.__len__() + 1
    M = response.__len__()

    X = []
    for value in response:
        X.append([value])
    i = 0
    while i < M:
        j = 0
        while j < N - 1:
            X[i].append(predictors[j][i])
            j += 1
        i += 1

    if debug:
        print 'X array:'
        for row in X:
            print row

    # Dispersion
    expectations = []
    dispersions = []
    deviations = []

    j = 0
    while j < N:
        expectation = 0
        i = 0
        while i < M:
            expectation += X[i][j]
            i += 1
        expectation /= M * 1.0

        dispersion = 0
        i = 0
        while i < M:
            dispersion += (X[i][j] - expectation) ** 2
            i += 1
        dispersion /= (M - 1.0)

        deviation = math.sqrt(dispersion)

        if debug:
            print 'Dispersion analysis for %d variable:' % (j + 1)
            print 'Dispersion = %f, Expectation = %f, Deviation = %f' % (expectation, dispersion, deviation)

        expectations.append(expectation)
        dispersions.append(dispersion)
        deviations.append(deviation)
        j += 1

    # Correlation
    U = []
    i = 0
    while i < M:
        U.append([])
        j = 0
        while j < N:
            U[i].append((X[i][j] - expectations[j]) * 1.0 / deviations[j])
            j += 1
        i += 1

    if debug:
        print 'U-matrix:'
        for row in U:
            print row

        j = 0
        while j < N:
            expectation = 0
            i = 0
            while i < M:
                expectation += U[i][j]
                i += 1
            expectation /= M * 1.0

            dispersion = 0
            i = 0
            while i < M:
                dispersion += (U[i][j] - expectation) ** 2
                i += 1
            dispersion /= (M - 1.0)

            deviation = math.sqrt(dispersion)

            if debug:
                print 'Dispersion analysis for %d variable:' % (j + 1)
                print 'Dispersion = %f, Expectation = %f, Deviation = %f' % (expectation, dispersion, deviation)

            j += 1

    R = []
    j = 0
    while j < N:
        R.append([])
        k = 0
        while k < N:
            R[j].append([])
            R[j][k] = 0
            i = 0
            while i < M:
                R[j][k] += (U[i][j] * U[i][k])
                i += 1
            R[j][k] /= M
            k += 1
        j += 1

    if debug:
        print 'Correlation coefficients: '
        for row in R:
            print row

    T = []
    i = 0
    while i < N:
        T.append([])
        k = 0
        while k < N:
            T[i].append(math.fabs(R[i][k]) * math.sqrt(N - 2) / math.sqrt(1 - R[i][k] * R[i][k]))
            k += 1
        i += 1

    if debug:
        print 'Model parameters: '
        for row in T:
            print row

    #
    # Regression
    #

    y = response

    if debug:
        print 'Y matrix:'
        print y

    x = []
    i = 0
    while i < M:
        x.append([1, ])
        j = 1
        while j < N:
            x[i].append(predictors[j - 1][i])
            j += 1

        i += 1

    if debug:
        print 'X matrix:'
        for row in x:
            print row

    B = []
    k = 0
    while k < N:
        B.append(0)
        i = 0
        while i < M:
            B[k] += y[i] * x[i][k] * 1.0
            i += 1
        k += 1

    if debug:
        print 'B matrix:'
        print B

    A = []
    j = 0
    while j < N:
        A.append([])
        k = 0
        while k < N:
            A[j].append(0)
            i = 0
            while i < M:
                A[j][k] += x[i][j] * x[i][k] * 1.0
                i += 1
            k += 1
        j += 1

    if debug:
        print 'A matrix:'
        for row in A:
            print row

    # solving AX=B using Gauss method
    i = 0
    while i < N:
        k = A[i][i]
        j = 0
        while j < N:
            A[i][j] /= k * 1.0
            j += 1
        B[i] /= k * 1.0
        t = i + 1
        while t < N:
            k = A[t][i]
            j = 0
            while j < N:
                A[t][j] -= A[i][j] * k
                j += 1
            B[t] -= B[i] * k
            t += 1
        i += 1

    X = []
    i = 0
    while i < N:
        X.append(B[i])
        i += 1
    i = N - 1
    while i >= 0:
        j = i + 1
        while j < N:
            X[i] -= A[i][j] * X[j]
            j += 1
        i -= 1

    if debug:
        print 'regression coefficients: '
        print X

    error = 0
    i = 0
    while i < M:
        evaluation = 0
        j = 0
        while j < N:
            evaluation += X[j] * x[i][j]
            j += 1
        error += math.fabs(evaluation - response[i])
        i += 1

    index = worst_index(T[0], M)
    if index == -1:
        g = None
    else:
        g = groups[index - 1]

    return {
        'group': g,
        'regression': X,
        'error': error
    }


def worst_index(T, M):
    t_crit = {
        1: 12.7060,
        2: 4.3020,
        3: 3.182,
        4: 2.776,
        5: 2.570,
        6: 2.4460,
        7: 2.3646,
        8: 2.3060,
        9: 2.2622,
        10: 2.2281,
        11: 2.201,
        12: 2.1788,
        13: 2.1604,
        14: 2.1448,
        15: 2.1314,
        16: 2.1190,
        17: 2.1098,
        18: 2.1009,
        19: 2.0930,
        20: 2.08600,
        21: 2.0790,
        22: 2.0739,
        23: 2.0687,
        24: 2.0639,
        25: 2.0595,
        26: 2.059,
        27: 2.0518,
        28: 2.0484,
        29: 2.0452,
        30: 2.0423,
        32: 2.0360,
        34: 2.0322,
        36: 2.0281,
        38: 2.0244,
        40: 2.0211,
        42: 2.018,
        44: 2.0154,
        46: 2.0129,
        48: 2.0106,
        50: 2.0086,
        55: 2.0040,
        60: 2.0003,
        65: 1.997,
        70: 1.9944,
        80: 1.9900,
        90: 1.9867,
        100: 1.9840,
        120: 1.9719,
        150: 1.9759,
        200: 1.9719,
        250: 1.9695,
        300: 1.9679,
        400: 1.9659,
        500: 1.9640,
    }
    while not M in t_crit:
        M -= 1

    t = t_crit[M]

    worst = min(T)
    if worst < t:
        i = 0
        for x in T:
            if x == worst:
                return i
            i += 1
    else:
        return -1


def evaluate(project):
    groups = QuestionGroup.objects.filter(included=1, position_No__gt=0)

    result = QuestionGroup.objects.get(position_No=0).regression_coefficient

    for group in groups:
        questions = Question.objects.filter(id_question_group=group)
        value = 0
        for question in questions:
            answers = Answer.objects.filter(project=project, question=question)
            if group.group_type.group_type != 'enum':
                for answer in answers:
                    if answer.value == '1':
                        value += question.value
            else:
                value += answers.__len__()
        result += group.regression_coefficient * value

    return result