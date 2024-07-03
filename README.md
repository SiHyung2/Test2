1) 매매가 가격 데이터 가져옴 (국토대장부)
2) 초등학교 데이터 가져옴 
   2-1) https://www.schoolinfo.go.kr/ng/go/pnnggo_a01_l2.do   (학년별*학급별 학생수 데이터를 뽑아야함)
   2-2) 엑셀 10년 데이터를 합침
   2-3) 학생수와 매매가의 분석을 위하여 VLOOKUP 함수로 가장 가까운 초등학교별 아파트 매매가표를 만듦
      2-3) 년도와 학교의 열을 합친 열을 만든후 년도와 학교을 조건으로 VLOOKUP
3) 평단가 구하기 (면적 데이터 * 실거래가 / 3.30579)
4) 지오코딩에 넣고 위치 구하기... (파이썬으로도 구현 가능해보임)
    4-1) https://docs.google.com/spreadsheets/d/1o1_lOWnpdpTmxibp7UYF-k-4JwayFHuDEURU-TLf4us/edit?usp=sharing
    4-2) 확장 프로그램 -> geocoding
5) 초-아거리_구하기.ipynb   실행
   5-1) 불러오는 파일이름 바꾸기
   5-2) 딕셔너리 생성 후 데이터 프레임에 저장하는 셀에 distances 딕셔너리를 보면
         초등학교 이름열이 있음 초등학교 이름 변경 필요.
   5-3) to_csv에서 저장되는 파일 이름 변경
6) 엑셀에서 최저거리 초등학교를 구한다
   6-1) 최저거리 초등학교 거리 함수 : N2:AK2는 초등학교와의 거리열 데이터를 모두 선택한 것
	함수 식 : 	=MIN(N2:AK2)
   6-2) 최저거리 초등학교 이름 함수 : $N$1:$AK$1 : 결과값을 추출할 회사 범위를 지정.(A학교~D학교)
			MATCH(MAX(C3:F3),C3:F3,0 : MAX함수로 범위내에서 최고값을 설정해주고 
			그 최고값이 범위내에서 몇번째에 위치한 값인지와 정확한 값인지 지정.
	함수 식 : 	=INDEX($N$1:$AK$1,MATCH(MIN(N2:AK2),N2:AK2,0))
   6-3) 초품아 등급 : (안써도 무방함) (거리에 따른 등급을 매김) (과정 생략)
	함수 식 : =IF(AL2<=$AS$4,AT4, IF(AL2<=$AS$5,$AT$5, IF(AL2<=$AS$6,$AT$6, IF(AL2<=$AS$7,$AT$7, IF(AL2<=$AS$8,$AT$8, -1)))))
   
7) 이상치 처리
   7-1) 서초구 전체 기준
         7-1-1)  iqr 방식 이상치 처리
	 iqr : 
		def remove_outliers(df, column):
		    Q1 = df[column].quantile(0.25)
		    Q3 = df[column].quantile(0.75)
		    IQR = Q3 - Q1
		    lower_bound = Q1 - 1.5 * IQR
		    upper_bound = Q3 + 1.5 * IQR
		    return df[(df[column] >= lower_bound) & (df[column] <= upper_bound)]
         7-1-2)  z-socre방식 이상치 처리
              z-score :
 		# 신뢰도 95% 기준 이상치 Index 추출
		outlier = df[(abs((df['price']-df['price'].mean())/df['price'].std()))>1.96].index
		# 추출한 인덱스의 행을 삭제하여 clean_df 생성
		clean_df = df.drop(outlier)
     7-2) 초등학교별 기준
         7-2-1)  iqr 방식 이상치 처리
	 iqr : 
		def remove_outliers(df, column):
		    Q1 = df[column].quantile(0.25)
		    Q3 = df[column].quantile(0.75)
		    IQR = Q3 - Q1
		    lower_bound = Q1 - 1.5 * IQR
		    upper_bound = Q3 + 1.5 * IQR
		    return df[(df[column] >= lower_bound) & (df[column] <= upper_bound)]
         7-2-2)  z-socre방식 이상치 처리
              z-score :
 		# 신뢰도 95% 기준 이상치 Index 추출
		outlier = df[(abs((df['price']-df['price'].mean())/df['price'].std()))>1.96].index
		# 추출한 인덱스의 행을 삭제하여 clean_df 생성
		clean_df = df.drop(outlier)
8) 엑셀 파일에 모두 저장한 후 태블로에서 가공한다.
