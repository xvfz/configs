#include <stdio.h>
#include <curl/curl.h>
#include <string.h>
#include <stdlib.h>

#define MAX_BUF 65536

char wr_buf[MAX_BUF+1]; //буфер curl'а
int wr_index;
char perc[20][10];

size_t write_data(void *buffer, size_t size, size_t nmemb, void *userp){
	int segsise = size * nmemb;
	if (wr_index + segsise > MAX_BUF) {
		*(int *)userp = 1;
		return 0;
	}
	memcpy((void *)&wr_buf[wr_index], buffer, (size_t)segsise);
	wr_index += segsise;
	wr_buf[wr_index] = 0;
	return segsise;
}

int araragi_kun(void){

	CURL *curl;
	CURLcode res;
	int wr_error;

	wr_error = 0;
	wr_index = 0;

	curl = curl_easy_init();
	if(curl) {
		curl_easy_setopt(curl, CURLOPT_URL, "http://dustcoin.com/mining");
		curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
		curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void *)&wr_error);
		curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);

		res = curl_easy_perform(curl);
		
		if(res != CURLE_OK){
			fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
			exit;}

		curl_easy_cleanup(curl);
	}
	return 0;
}


char percent(){
	//char perc[20][10]; //массив с процентами
	int i;
	int b=0; //счетчик возврата каретки
	int count=0; //счетчик проходов(количество значений)
	int sz; //счетчик чаров взначении

for(i=1;wr_buf[i]!='\0';i++){ //читаем посимвольно буфер
	
	if(wr_buf[i]=='%') //находим символ %
	{
		b=i;
		
		while(wr_buf[b]!='>'){ //откатываем каретку в начало значения
			b--;
		}

		b++;
		sz=0;
	
		for(;b<i;b++){ //начинаем записывать значение посимвольно в буфер([строка][символ])
			sprintf(&perc[count][sz], "%c", wr_buf[b]);
			sz++;
		}
		printf("perc:%s\tsz:%i\tcount:%i\n", perc[count], sz, count); //дебаг
		count++;
	}
}
	return count;
}

int main(void){
araragi_kun();
int count;
count = percent();
int i;
float bitcoin = atoi(perc[0]);

for(i=0;i<=count-1;i++)
printf("%s\n", perc[i]);
printf("bitcoin %.2f\n", bitcoin);
}