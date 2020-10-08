#ifndef __QOS_ANALYZER_H__
#define __QOS_ANALYZER_H__

#include <pjsua.h>
#include <pjsua-lib/pjsua_internal.h>

#define THIS_FILE "qos_analyzer.c"
#define INVALID_MEDIA_IDX -1


typedef struct QoSResult_s {
	unsigned loss;
	unsigned loss_percentage;
	unsigned period;
	unsigned total_pkts;
	unsigned jitter;
	unsigned rtt;

	unsigned aud_loss;
	unsigned aud_loss_percentage;
	unsigned aud_period;
	unsigned aud_total_pkts;
	unsigned aud_jitter;
	unsigned aud_rtt;

	pj_bool_t dec_rate_50;
	pj_bool_t inc_rate_50;
	pj_bool_t dec_rate_20;
	pj_bool_t inc_rate_20;
	pj_bool_t pause_video;
	int reason;
} QosResult;

//const static char *adaptive_event_msg[] = {
//	"None",
//	"Decreased video rate as loss_percentage >= significant loss and jitter >= significant jitter",
//	"Decreased video rate as rtt > significant delay",
//	"Decreased video rate as loss_percentage >= significant loss",
//	"None",
//	"Video Rate was decreased earlier. Increasing rate as loss_percentage < significant loss rate and jitter < significant jitter",
//	"Video Rate was decreased earlier. Increasing rate as loss_percentage < significant loss rate",
//	"Video Rate was decreased earlier. Increasing rate as rtt has improved",
//	"Ending call as both last_jitter and jitter >= extreme jitter",
//	"Ending call as both last_rtt and rtt >= extreme delay",
//	"Ending call as extreme packet loss rate and extreme jitter",
//	"Ending call as internet down for more than internetDownTimeout seconds",
//	"Ending call as both audio last_jitter and audio jitter >= extreme audio jitter",
//	"Ending call as both audio last_rtt and audio rtt >= extreme audio delay",
//	"Ending call as extreme audio loss rate and extreme audio jitter",
//	"Pausing video as significant audio loss rate and significant jitter",
//	"Ending Call as continued significant audio loss rate and significant jitter",
//	"Pausing video as significant audio rtt is twice last rtt",
//	"Ending call as audio rtt is twice last rtt even after pausing video",
//	"Restarting video as audio loss rate acceptable and no big jitter",
//	"Restarting video as audio loss rate is less than audio significant loss rate",
//	"Ending Call. Internet Down",
//	"Pausing video as significant audio jitter last 10 seconds",
//	"Ending call as significant audio jitter last 20 seconds",
//	"Video paused after video rate decrease",
//	"END"
//};

typedef enum AdaptiveEvents_e {
	ADAPTIVE_NONE,
	VIDEO_RATE_DECREASED_LOSS_JITTER,
	VIDEO_RATE_DECREASED_RTT,
	VIDEO_RATE_DECREASED_LOSS,
	ADAPTIVE_NONE_4,
	VIDEO_RATE_INCREASED_IMPROVED_LOSS_JITTER,
	VIDEO_RATE_INCREASED_IMPROVED_LOSS,
	VIDEO_RATE_INCREASED_IMPROVED_RTT,
	EXTREME_VIDEO_JITTER,
	EXTREME_VIDEO_DELAY,
	EXTREME_VIDEO_LOSS_JITTER,
	INTERNET_DOWN_TIMEOUT,
	EXTREME_AUDIO_JITTER,
	EXTREME_AUDIO_DELAY,
	EXTREME_AUDIO_LOSS,
	PAUSE_VIDEO_AUDIO_LOSS_JITTER,
	AUDIO_LOSS_JITTER,
	PAUSE_VIDEO_AUDIO_RTT,
	END_CALL_AUDIO_RTT,
	RESTART_VIDEO_IMPROVED_AUDIO_LOSS_JITTER,
	RESTART_VIDEO_IMPROVED_AUDIO_LOSS,
	INTERNET_DOWN,
	PAUSE_VIDEO_AUDIO_JITTER,
	AUDIO_JITTER,
	VIDEO_PAUSED_AFTER_RATE_DECREASE,
	ADAPTIVE_END,
	PAUSE_VIDEO_VIDEO_LOSS_JITTER,
	CATASTROPHIC_FAILURE,
	EVERYTHING_OK,
	RTCP_PACKETS_SAME,
	VIDEO_PAUSED
}; AdaptiveEvents_e;

enum {
	VIDEO_OFF = 0,
	VIDEO_ON
};

enum {
	HEURISTIC_CONDITIONAL = 0,
	HEURISTIC_ACTION,
	HEURISTIC_LOG,
	HEURISTIC_ENDS_CALL
};

enum {
	VIDEO_STREAM = 0,
	AUDIO_STREAM
};


//
pj_bool_t audio_catastrophic(QosResult *res);
pj_bool_t pause_video_because_audio(QosResult *res);
pj_bool_t end_call_because_audio(QosResult *res);
pj_bool_t pause_video(QosResult *res);
void reset_values();
unsigned calculate_loss_percentage(unsigned last_loss, unsigned loss, unsigned total_pkts_last, unsigned total_pkts);
void update_last_rtcp_stats();
pj_bool_t rtcp_state_audio_unchanged();
pj_bool_t rtcp_state_video_unchanged();
void assign_values(QosResult * res, pjsua_stream_stat *stat, pj_bool_t video);




unsigned vid_significant_loss_rate;
unsigned vid_significant_jitter; /*us */
unsigned vid_significant_delay; /* ms */
unsigned vid_extreme_loss_rate;
unsigned vid_extreme_jitter; /*us */
unsigned vid_extreme_delay; /* ms */

unsigned aud_significant_loss_rate;
unsigned aud_significant_jitter; /*us */
unsigned aud_significant_delay; /* ms */
unsigned aud_extreme_loss_rate;
unsigned aud_extreme_jitter; /*us */
unsigned aud_extreme_delay; /* ms */

unsigned vid_loss;
unsigned vid_last_loss;
unsigned vid_period;
unsigned vid_last_period;
unsigned vid_total_pkts;
unsigned vid_total_pkts_last;
unsigned vid_jitter;
unsigned vid_last_jitter;
unsigned vid_rtt;
unsigned vid_last_rtt;
// int vid_rate_decreased;
int vid_paused;
// int vid_rate_just_decreased;
//
///* audio */
unsigned aud_loss;
unsigned aud_last_loss;
unsigned aud_period;
unsigned aud_last_period;
unsigned aud_total_pkts;
unsigned aud_total_pkts_last;
unsigned aud_jitter;
unsigned aud_last_jitter;
unsigned aud_rtt;
unsigned aud_last_rtt;

unsigned vid_loss_percentage;
unsigned aud_loss_percentage;

unsigned int min_aud_repeat;

double bad_sip_connection_factor;

//_____________________________________

const static pj_str_t c_id = { "H264", 4 };
unsigned storage_original_max_bitrate;
unsigned storage_original_avg_bitrate;
unsigned storage_original_fps;

void vid_stream_start_stop(unsigned on, int call_id);
void vid_stream_reset(int call_id);
pj_status_t set_fps(int fps, int call_id);
void get_bps(int call_id, int aud_idx);
//
//
////____________________________________________
//
//
void get_media_type_index();
int get_media_stream_statistics(int media_idx, pjsua_stream_stat *stat);
int analyze(QosResult *res, pj_bool_t video);
pj_status_t perform_qos_analysis(QosResult *res, int call_id);
void reset_qos();
void reset_values();
pj_status_t perform_qos_analysis(QosResult *res, int call_id);

static pj_bool_t first_time = 1;
int aud_idx;
int vid_idx;
int reason;
int seconds;
pj_timer_entry *entry;
pj_time_val delay;
pjsua_call *call;
unsigned call_id;

typedef void(__stdcall *BADSIPCONNECTION)();
BADSIPCONNECTION bad_sip_connection_handler;
int bad_sip_connection_handler_exists;
//

#endif
